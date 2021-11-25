// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ui/Authentication/login.dart';
import 'package:ui/screens/home_screen.dart';
import 'package:ui/screens/status_screen.dart';
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
      title: 'KLabchart',
           debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Colors.blue.shade300,
        accentColor: Colors.blue.shade50,
      ),
      home:RegisterScreen(),
      
    );
  }
}

