import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:water_monitering_system/pages/homepage.dart';
import 'package:water_monitering_system/pages/puritystat.dart';
// import 'homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
