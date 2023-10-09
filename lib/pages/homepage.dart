import 'package:flutter/material.dart';
import 'package:sa3_liquid/sa3_liquid.dart';
import 'package:water_monitering_system/pages/puritystat.dart';
import 'package:water_monitering_system/pages/wateravailable.dart';
// import 'package:wms/HomePage.dart';
// import 'package:wms/wateravailable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double deviceWidth;
  late double deviceHeight;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
            color: Color.fromARGB(57, 5, 148, 231),
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
                child: SafeArea(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Water Monitoring System",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Container(
                            width: deviceWidth,
                            height: 150,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(79, 75, 96, 182),
                                  Color.fromARGB(159, 134, 134, 222),
                                  Color.fromARGB(179, 142, 141, 214)
                                  // Colors.blueGrey,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Center(
                                  child: Text(
                                    "Water Available",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Open Sans',
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: -26,
                            child: FloatingActionButton(
                            heroTag: 'wateravaliable',
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const wateravailable(),
                                  ),
                                );
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 98, 47, 116),
                              child: const Icon(Icons.arrow_right_alt_rounded),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Container(
                            width: deviceWidth,
                            height: 150,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(79, 75, 96, 182),
                                  Color.fromARGB(159, 134, 134, 222),
                                  Color.fromARGB(179, 142, 141, 214)
                                  // Colors.blueGrey,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Center(
                                  child: Text(
                                    "Water Purity",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Open Sans',
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: -26,
                            child: FloatingActionButton(
                              heroTag: 'purity',
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Purity(),
                                  ),
                                );
                                // Navigator.pop(context);
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 98, 47, 116),
                              child: const Icon(Icons.arrow_right_alt_rounded),
                            ),
                          ),
                        ],
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
