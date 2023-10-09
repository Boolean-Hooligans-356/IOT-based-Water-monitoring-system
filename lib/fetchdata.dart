// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class WaterRemainingWidget extends StatelessWidget {
//   const WaterRemainingWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance.collection('waterdetails').doc('58fbdiVPUbhFb3nHkCJv').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return const CircularProgressIndicator();
//         }
//         var waterRemaining = snapshot.data!['WaterRemaining'];
//         return Text('$waterRemaining',style: const TextStyle(fontSize: 24,
//                                     fontFamily: 'Open Sans',
//                                     color: Colors.white),);
//       },
//     );
//   }
// }

import 'dart:async';
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// double Total = _Flow1 + _Flow2;

class WaterRemainingWidget extends StatefulWidget {
  const WaterRemainingWidget({super.key});

  @override
  _WaterRemainingWidgetState createState() => _WaterRemainingWidgetState();
}

class _WaterRemainingWidgetState extends State<WaterRemainingWidget> {
  late DatabaseReference _waterRemainingRef;
  String _waterRemaining = "Loading...";

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _waterRemainingRef =
        FirebaseDatabase.instance.ref().child('WaterRemaining/percentage');
    _waterRemainingRef.onValue.listen((event) {
      setState(() {
        _waterRemaining = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var output=_waterRemaining.split('')
    return Text(
      " $_waterRemaining%",
      style: TextStyle(fontSize: 20, color: Colors.grey[100]),
    );
  }
}

class Flow1Widget extends StatefulWidget {
  const Flow1Widget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Flow1WidgetState createState() => _Flow1WidgetState();
}

class _Flow1WidgetState extends State<Flow1Widget> {
  // ignore: non_constant_identifier_names
  late DatabaseReference _Flow1Ref;
  // ignore: non_constant_identifier_names
  String _Flow1 = "Loading...";
  // String _Flow01 = "Loading...";

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _Flow1Ref = FirebaseDatabase.instance.ref().child('Waterflow/Volumeof0');
    // _Flow1Ref = FirebaseDatabase.instance.ref().child('Waterflow/flow0(LM)');
    _Flow1Ref.onValue.listen((event) {
      setState(() {
        _Flow1 = event.snapshot.value.toString();
        _Flow1 ;
        // _Flow01 = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var output=_waterRemaining.split('')
    return Text(
      " $_Flow1 L ",
      style: TextStyle(fontSize: 20, color: Colors.grey[100]),
    );
  }
}

class Flow2Widget extends StatefulWidget {
  const Flow2Widget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Flow2WidgetState createState() => _Flow2WidgetState();
}

class _Flow2WidgetState extends State<Flow2Widget> {
  // ignore: non_constant_identifier_names
  late DatabaseReference _Flow2Ref;
  // ignore: non_constant_identifier_names
  String _Flow2 = "Loading...";
  // String _Flow02 = "Loading...";

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _Flow2Ref = FirebaseDatabase.instance.ref().child('Waterflow/Volumeof1');
    // _Flow2Ref = FirebaseDatabase.instance.ref().child('Waterflow/flow1(LM)');
    _Flow2Ref.onValue.listen((event) {
      setState(() {
        _Flow2 = event.snapshot.value.toString();
        // _Flow2 ;
        // _Flow02 = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var output=_waterRemaining.split('')
    return Text(
      " $_Flow2 L ",
      style: TextStyle(fontSize: 20, color: Colors.grey[100]),
    );
  }
}

class Flow02Widget extends StatefulWidget {
  const Flow02Widget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Flow02WidgetState createState() => _Flow02WidgetState();
}

class _Flow02WidgetState extends State<Flow02Widget> {
  // ignore: non_constant_identifier_names
  late DatabaseReference _Flow02Ref;
  // ignore: non_constant_identifier_names
  String _Flow02 = "Loading...";
  // String _Flow02 = "Loading...";

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    // _Flow02Ref = FirebaseDatabase.instance.ref().child('Waterflow/Volumeof1');
    _Flow02Ref = FirebaseDatabase.instance.ref().child('Waterflow/flow1(LM)');
    _Flow02Ref.onValue.listen((event) {
      setState(() {
        _Flow02 = event.snapshot.value.toString();
        // _Flow02 = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var output=_waterRemaining.split('')
    return Text(
      " $_Flow02 L/Min ",
      style: TextStyle(fontSize: 20, color: Colors.grey[100]),
    );
  }
}

class Flow01Widget extends StatefulWidget {
  const Flow01Widget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Flow01WidgetState createState() => _Flow01WidgetState();
}

class _Flow01WidgetState extends State<Flow01Widget> {
  // ignore: non_constant_identifier_names
  late DatabaseReference _Flow01Ref;
  // ignore: non_constant_identifier_names
  String _Flow01 = "Loading...";
  // String _Flow02 = "Loading...";

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    // _Flow02Ref = FirebaseDatabase.instance.ref().child('Waterflow/Volumeof1');
    _Flow01Ref = FirebaseDatabase.instance.ref().child('Waterflow/flow0(LM)');
    _Flow01Ref.onValue.listen((event) {
      setState(() {
        _Flow01 = event.snapshot.value.toString();
        // _Flow02 = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var output=_waterRemaining.split('')
    return Text(
      " $_Flow01 L/Min ",
      style: TextStyle(fontSize: 20, color: Colors.grey[100]),
    );
  }
}

class PhWidget extends StatefulWidget {
  const PhWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhWidgetState createState() => _PhWidgetState();
}

class _PhWidgetState extends State<PhWidget> {
  // ignore: non_constant_identifier_names
  late DatabaseReference _PhRef;
  // ignore: non_constant_identifier_names
  String _Ph = "Loading...";
  // String _Flow02 = "Loading...";

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    // _Flow02Ref = FirebaseDatabase.instance.ref().child('Waterflow/Volumeof1');
    _PhRef = FirebaseDatabase.instance.ref().child('quality/ph');
    _PhRef.onValue.listen((event) {
      setState(() {
        _Ph = event.snapshot.value.toString();
        // _Flow02 = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var output=_waterRemaining.split('')
    return Text(
      " $_Ph  ",
      style: TextStyle(fontSize: 20, color: Colors.grey[100]),
    );
  }
}

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TemperatureWidgetState createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  // ignore: non_constant_identifier_names
  late DatabaseReference _TemperatureRef;
  // ignore: non_constant_identifier_names
  String _Temperature = "Loading...";
  // String _Flow02 = "Loading...";

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    // _Flow02Ref = FirebaseDatabase.instance.ref().child('Waterflow/Volumeof1');
    _TemperatureRef = FirebaseDatabase.instance.ref().child('quality/temp');
    _TemperatureRef.onValue.listen((event) {
      setState(() {
        _Temperature = event.snapshot.value.toString();
        // _Flow02 = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var output=_waterRemaining.split('')
    return Text(
      " $_Temperature  ",
      style: TextStyle(fontSize: 20, color: Colors.grey[100]),
    );
  }
}

// class TotalUsageWidget extends StatefulWidget {
//   const TotalUsageWidget({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _TotalUsageWidgetState createState() => _TotalUsageWidgetState();
// }

// class _TotalUsageWidgetState extends State<TotalUsageWidget> {
// final databaseRef = FirebaseDatabase.instance.ref();


//   @override
//   void initState() {
//     super.initState();
//     // ignore: deprecated_member_use
//   databaseRef.once().then((DataSnapshot snapshot) {
//   double volume1 = double.parse(snapshot.value?.('flowSensor1Volume'));
//   double volume2 = double.parse(snapshot.value['flowSensor2Volume']);
//   double totalVolume = volume1 + volume2;
//   print('Total Volume: $totalVolume');
// } as FutureOr Function(DatabaseEvent value));



//     // _TotalUsageRef1 = FirebaseDatabase.instance.ref();
//     // _TotalUsageRef1.once().then((DataSnapshot snapshot) {
//     //   double _TotalUsage1 =
//     //       double.parse(snapshot._TotalUsageRef1['Waterflow/Volumeof0']);
//     // });
//     // _TotalUsageRef2 =
//     //     FirebaseDatabase.instance.ref().child('Waterflow/Volumeof1');
//     // // _Flow1Ref = FirebaseDatabase.instance.ref().child('Waterflow/flow0(LM)');
//     // _TotalUsageRef1.onValue.listen((event) {
//     //   setState(() {
//     //     _TotalUsage1 = event.snapshot.value.toDouble();
//     //     _TotalUsage1 * 1000;
//     //     //  _TotalUsage2 = event.snapshot.value.toString();
//     //     // _TotalUsage2 * 1000;
//     //     // _Flow01 = event.snapshot.value.toString();
//     //   });
//     // });
//     // _TotalUsageRef2.onValue.listen((event) {
//     //   setState(() {
//     //     // _TotalUsage1 = event.snapshot.value.toString();
//     //     // _TotalUsage1 * 1000;
//     //     _TotalUsage2 = event.snapshot.value.toString();
//     //     _TotalUsage2 * 1000;
//     //     // _Flow01 = event.snapshot.value.toString();
//     //   });
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var output=_waterRemaining.split('')
//     double Total = _TotalUsage1 + _TotalUsage2;
//     return Text(
//       " $_TotalUsage1 + $_TotalUsage2 L ",
//       style: TextStyle(fontSize: 20, color: Colors.grey[100]),
//     );
//   }
// }
