import 'package:flutter/material.dart';
import 'package:sa3_liquid/sa3_liquid.dart';
import 'package:water_monitering_system/fetchdata.dart';
import 'package:water_monitering_system/pages/month.dart';
import 'package:water_monitering_system/pages/today.dart';
import 'package:water_monitering_system/pages/wateravailable.dart';
import 'package:water_monitering_system/pages/week.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> with TickerProviderStateMixin {
  late double deviceWidth;
  late double deviceHeight;
  

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const wateravailable()));
                            },
                            icon: const Icon(
                              Icons.arrow_circle_left_sharp,
                              color: Colors.grey,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Water Usage",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: 50,
                          color: Colors.grey.withGreen(185),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: deviceWidth,
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(128, 235, 239, 255),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            children: [
                              Text(
                                "Total Water Used Today:",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              // const TotalUsageWidget()

                              // const NextPage()
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: deviceWidth,
                        height: 25,
                        child: TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            controller: tabController,
                            tabs: const [
                              Tab(
                                text: 'Today',
                                // child: Image.asset('assets/icons/icons8-clock.gif',
                                // height: 10,width: 10,),
                                // icon: Icon(Icons.today),
                              ),
                              Tab(
                                text: 'Week',
                                // icon: Icon(Icons.weekend),
                              ),
                              Tab(
                                text: 'Month',
                                // icon: Icon(Icons.calendar_view_month),
                              ),
                            ]),
                      ),
                      SizedBox(
                          width: deviceWidth,
                          height: double.maxFinite,
                          child: TabBarView(
                            controller: tabController,
                            children: const [
                              // SizedBox(height: 30,),
                              Today(),
                              Week(),
                              Month()
                            ],
                          ))
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
