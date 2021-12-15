// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/07_profile/body.dart';

import 'package:ui/Authentication/login.dart';
import 'package:ui/screens/home_screen.dart';

import 'package:ui/screens/bottom_nav_screen.dart';

import 'Authentication/signup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KLab',
           debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Color(0xff282d36),
        accentColor: Color(0xff313a4a),
      ),
      home:SigninScreen(),
      
    );
  }
}

