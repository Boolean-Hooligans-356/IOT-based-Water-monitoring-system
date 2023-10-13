# IOT-based Water Monitoring System 

In today's world, proper utilization of available water resources is essential. Despite this critical need, it is often observed that improper water flow through pipelines goes unnoticed and unaddressed. Moreover, the risk of impure water mixing with potable water presents a significant threat, potentially leading to a host of undesirable consequences. The current state of water management systems often falls short of ensuring the efficiency and safety of water distribution.

To address these challenges and enhance water management, our innovative monitoring system, powered by Internet of Things (IoT) technology and the NodeMCU microcontroller, has been designed with a clear focus on comprehensive pipeline monitoring. The system's strategic placement of various sensors, including flow sensors, enables real-time and detailed tracking of water usage and flow status throughout the pipeline network.

The central control hub, NodeMCU, acts as the nerve center, seamlessly coordinating the hardware components and collecting sensor data. Its integrated Wi-Fi module facilitates the immediate transmission of this data to Firebase, a secure cloud-based platform. The collected data is safely stored and made accessible for further analysis and utilization.

However, the most significant aspect of this groundbreaking system lies in its integration with a user-friendly mobile application. The mobile app serves as a visual interface for end-users, providing valuable insights into their water consumption, flow statistics, and even the purity of the water. This visualization empowers users to make informed decisions regarding their water resources, promoting responsible water management practices.


 ![WhatsApp Image 2023-10-09 at 10 34 54_451aa95a](https://github.com/Boolean-Hooligans-356/IOT-based-Water-monitoring-system/assets/96923418/f70cd05a-f3e1-4bf9-903a-9c64b661fa34)

Hardware components:
 1. Node MCU: The Node MCU serves as the central microcontroller, facilitating seamless coordination among all the sensors and components. Its integrated Wi-Fi module enables real-time data transmission and connectivity.
 2. Water Flow Sensors (YF-S201): These sensors are strategically placed throughout the pipeline network to monitor and report on water flow. Their precise measurements play a vital role in tracking water consumption and flow status.
 3. Turbidity Sensor: The turbidity sensor is instrumental in assessing water quality by measuring the level of suspended particles and impurities in the water. It provides valuable data on water purity.
 4. pH Probe: The pH probe is essential for monitoring the acidity or alkalinity of the water, ensuring that the water's chemical composition is within safe and acceptable limits.
 5. Dallas Temperature Sensor DS18B20: This temperature sensor offers accurate temperature readings, which can be crucial in identifying potential issues such as freezing or overheating in the pipeline.
 6. Ultrasonic HC-SR04: The ultrasonic sensor is used to measure the water level or depth in tanks or reservoirs, providing insights into water availability and usage.

Data storage:
  We've used Google Firebase's Realtime database 

In conclusion, our innovative monitoring system responds to the pressing need for efficient and secure water resource management. Ensuring proper water flow and monitoring water purity, plays a vital role in safeguarding the quality and availability of potable water. Through the power of IoT technology, NodeMCU, and user-friendly mobile applications, we are taking a significant step towards responsible and informed water management, ultimately benefiting individuals and communities alike.

