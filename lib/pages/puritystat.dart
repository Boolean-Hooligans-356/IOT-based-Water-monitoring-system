import 'package:flutter/material.dart';

import 'package:sa3_liquid/sa3_liquid.dart';
import 'package:water_monitering_system/fetchdata.dart';

import 'package:water_monitering_system/pages/homepage.dart';

class Purity extends StatefulWidget {
  const Purity({super.key});

  @override
  State<Purity> createState() => _PurityState();
}

class _PurityState extends State<Purity> {
  late double deviceWidth;
  late double deviceHeight;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.mirror,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0x868f96FF),
                // Color(0x596164FF),
                Color(0x000000ff),
              ],
              stops: [
                0,
                1,
              ],
            ),
            backgroundBlendMode: BlendMode.srcOver,
          ),
          child: PlasmaRenderer(
            type: PlasmaType.bubbles,
            particles: 25,
            color: const Color.fromARGB(57, 5, 148, 231),
            blur: 0.2,
            size: 0.5,
            speed: 2,
            offset: 0,
            blendMode: BlendMode.plus,
            particleType: ParticleType.atlas,
            variation1: 1,
            variation2: 0.2,
            variation3: 0.1,
            rotation: 0,
            child: SizedBox(
              height: deviceHeight,
              width: deviceWidth,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  width: deviceWidth,
                  height: deviceHeight,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, right: 340),
                        child: SizedBox(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_circle_left_sharp,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Water Purity",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 50,
                          color: Colors.grey.withGreen(185),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: deviceWidth,
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(128, 235, 239, 255),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            children: [
                              Text(
                                "Water Status: Safe",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Detailed Statistics:",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.grey.withGreen(185),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: deviceWidth,
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(128, 235, 239, 255),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            children: [
                              Text(
                                "Temperature :",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              const TemperatureWidget(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: deviceWidth,
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(128, 235, 239, 255),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            children: [
                              Text(
                                "Turbidity:",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: deviceWidth,
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(128, 235, 239, 255),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            children: [
                              Text(
                                "PH-Level:",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              const PhWidget(),
                              const SizedBox(
                                height: 20,
                              ),
                              // Image.asset('assets/images/Ph level img.jpg')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
