import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:water_monitering_system/fetchdata.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
   late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: deviceWidth,
            height: 350,
            decoration: BoxDecoration(
                color: const Color.fromARGB(128, 235, 239, 255),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:12.0,left: 10.0),
                  child: Text(
                    "Water Used in Line1:",
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                const Flow1Widget(),
                const Flow01Widget(),
                const SizedBox(height: 30,),
                 Padding(
                  padding: const EdgeInsets.only(top:12.0,left: 10.0),
                  child: Text(
                    "Water Used in Line2:",
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                const Flow2Widget(),
                const Flow02Widget(),
                const SizedBox(height: 30,),
                 Padding(
                  padding: const EdgeInsets.only(top:12.0,left: 10.0),
                  child: Text(
                    "Water Used in Garden:",
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),


                // const NextPage()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
