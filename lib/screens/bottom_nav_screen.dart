import 'package:flutter/material.dart';
import 'package:ui/07_profile/compliteprofile.dart';
import 'package:ui/models/message_model.dart';
import 'package:ui/screens/announcement.dart';
import 'package:ui/screens/calls.dart';
import 'package:ui/screens/chat_screen.dart';
import 'package:ui/screens/edit_setting.dart';

import 'package:ui/screens/home_screen.dart';

import 'package:ui/screens/post_details_page.dart';
import 'package:ui/models/chatmodelpage.dart';




class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    const HomeScreen(),
    PostWidget(),
    AnnouncementsScreen(),
 profileScreen(),
  
];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff282d36),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        elevation: 0.0,
        items: const [
         BottomNavigationBarItem(
           icon: Icon(Icons.chat),
           title: Text('Chat'),
           backgroundColor: Colors.white
           ),
           
           BottomNavigationBarItem(
           icon: Icon(Icons.announcement),
           title: Text('Forum'),
           backgroundColor: Colors.white
           ),
           BottomNavigationBarItem(
           icon: Icon(Icons.add_alert),
           title: Text('Announcement'),
           backgroundColor: Colors.white
           ),
           BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('My Account'),
           backgroundColor: Colors.white
           ),
           
           
        ],
      
            // .asMap()
            // .map((key, value) => MapEntry(
            //       key,
            //       BottomNavigationBarItem(
            //         title: Text(''),
            //         icon: Container(
            //           padding: const EdgeInsets.symmetric(
            //             vertical: 6.0,
            //             horizontal: 16.0,
            //           ),
            //           decoration: BoxDecoration(
            //             color: _currentIndex == key
            //                 ? Colors.blue
            //                 : Colors.transparent,
            //             borderRadius: BorderRadius.circular(5.0),
            //           ),
            //           // child: Icon(value),
            //         ),
            //       ),
            //     ))
            // .values
            // .toList(),
      ),
    );
  }
}

