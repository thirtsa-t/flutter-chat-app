// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/Authentication/Authenticate.dart';
import 'package:ui/Authentication/login.dart';

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
       primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      home: LoginScreen(),
      
    );
  }
}

