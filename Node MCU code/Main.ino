#include <OneWire.h>
#include <DallasTemperature.h>


#include <Arduino.h>
#if defined(ESP32)
  #include <WiFi.h>
#elif defined(ESP8266)
  #include <ESP8266WiFi.h>
#endif
#include <Firebase_ESP_Client.h>

//Provide the token generation process info.
#include "addons/TokenHelper.h"
//Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"

// Insert your network credentials
#define WIFI_SSID "Wifi ssid"
#define WIFI_PASSWORD "wifi password"

// Insert Firebase project API Key
#define API_KEY "API key"

// Insert RTDB URLefine the RTDB URL */
#define DATABASE_URL "URL" 
float volume0;
float volume1;
//waterflow
const int sensor1Pin = 5;
const int sensor2Pin = 4;
float flow0 = 0;
float flow1 = 0;
float totalVolume0 = 0;
float totalVolume1 = 0;
unsigned long prevMillis = 0;
unsigned long prevMillis1 = 0;

const unsigned long interval = 1000; // interval between volume updates (ms)
//Ultra
const int trigPin = 12;
const int echoPin = 14;
int vst;
int x;
float a;
float b;
float y;
float percentage;
long duration;
float distanceCm;
float distanceInch;
#define SOUND_VELOCITY 0.034
#define CM_TO_INCH 0.393701
#define ONE_WIRE_BUS 4
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
//Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;

void setup(){
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  /* Sign up */
  if (Firebase.signUp(&config, &auth, "", "")){
    Serial.println("ok");
    signupOK = true;
  }
  else{
    Serial.printf("%s\n", config.signer.signupError.message.c_str());
  }

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h
  
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
  sensors.begin();
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  pinMode(sensor1Pin, INPUT);
  pinMode(sensor2Pin, INPUT);
}

void loop(){
    //ph
    
    String phdata = Serial.readStringUntil(':');
    Serial.println(phdata);
    String ph = Serial.readStringUntil('0');
    Serial.println(ph);
    float phvalue=ph.toFloat();
    Serial.println();
    Serial.print("PH value");
    //Serial.println(phdata);
    Serial.println(phvalue);
    delay(2000);

    
    //dallas - temperature 
    sensors.requestTemperatures(); 
    Serial.print("Celsius temperature: ");
    Serial.print(sensors.getTempCByIndex(0)); 
    Serial.print(" - Fahrenheit temperature: ");
    Serial.println(sensors.getTempFByIndex(0));
    delay(1000);
    
    //Ultrasonic
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    distanceCm = duration * SOUND_VELOCITY/2;
    distanceInch = distanceCm * CM_TO_INCH;
    //1000*20/100=100
    //variable = remainingcm * 1/20
    //vst = 20 - distanceCm;
    a=distanceCm/2;
    b=20-a;
    x = (vst * 1)/20;
    y = vst *10/100;
    percentage = (b/20)*100;
    Serial.print("Water present in the storage(cm): ");
    Serial.println(b);
    Serial.print("Water remaining (percentage): ");
    Serial.println(percentage);
    delay(1000);

    float flow0 = pulseIn(sensor1Pin, HIGH) / 7.5;
    float flow1 = pulseIn(sensor2Pin, HIGH) / 7.5;
    Serial.print("Flow 1: ");
    Serial.print(flow0);
    Serial.print(" L/min\tFlow 2: ");
    Serial.print(flow1);
    Serial.println(" L/min");
    delay(1000);
  
    unsigned long currentMillis = millis();
    if (currentMillis - prevMillis >= interval) {
      float volume0 = flow0 * interval / 60000; // volume in L
      totalVolume0 += volume0;
      prevMillis = currentMillis;
      Serial.print("Total Volume by Flow 1:");
      Serial.println(totalVolume0);
  
    }
    unsigned long currentMillis1 = millis();
    if (currentMillis1 - prevMillis1 >= interval) {
      float volume1 = flow1 * interval / 60000; // volume in L
      totalVolume1 += volume1;
      prevMillis = currentMillis;
      Serial.print("Total Volume by Flow 2:");
      Serial.println(totalVolume1);
  
    }
  
//----------------------FIREBASE--------------------------------------------------------------------------------
  //-----------------PH-----------------
  if (Firebase.ready() && signupOK && (millis() - sendDataPrevMillis > 15000 || sendDataPrevMillis == 0)){
    sendDataPrevMillis = millis();
    // Write an Int number on the database path test/int
    if (Firebase.RTDB.setInt(&fbdo, "quality/ph", phdata)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
    
    //----------------temperat---------------------
    // Write an Float number on the database path test/float
    if (Firebase.RTDB.setFloat(&fbdo, "quality/temp", sensors.getTempFByIndex(0))){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
    //-----------------------------Ultrasonic senor ------------------------------
    if (Firebase.RTDB.setFloat(&fbdo, "WaterRemaining/percentage", percentage)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
    if (Firebase.RTDB.setFloat(&fbdo, "WaterRemaining/level(cm)", b)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }

    //-----------------------------Water FLow----------------------------
    if (Firebase.RTDB.setFloat(&fbdo, "Waterflow/flow0(LM)", flow0)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
    //flow 2
    if (Firebase.RTDB.setFloat(&fbdo, "Waterflow/flow1(LM)", flow1)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }

    //VOLUME 0
    if (Firebase.RTDB.setFloat(&fbdo, "Waterflow/Volumeof0", totalVolume0)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }

    //VOLUME 1
    if (Firebase.RTDB.setFloat(&fbdo, "Waterflow/Volumeof1", totalVolume1)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }
  }
}
