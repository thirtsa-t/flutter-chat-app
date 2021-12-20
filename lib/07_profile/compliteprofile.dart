

import 'package:flutter/material.dart';
import 'package:ui/07_profile/body.dart';
import 'package:ui/screens/bottom_nav_screen.dart';

class profileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
        backgroundColor:  Color(0xFFF282d36),
         centerTitle: true,
        title: Text("My Account"),

                  leading: IconButton(
              onPressed: () {
               Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context) => BottomNavScreen()),
                       );
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              )),
      ),
      
      body: Body(),
      
    );
  }
}