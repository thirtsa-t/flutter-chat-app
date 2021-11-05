import 'package:flutter/material.dart';

import 'package:ui/screens/login.dart';

void main() {
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
        primaryColor: Colors.white,
        accentColor: Color(0x73000000)      
        // primary: Colors.blue,1
      ),
      home: LoginScreen(),
      
    );
  }
}

