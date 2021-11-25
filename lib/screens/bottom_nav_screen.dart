import 'package:flutter/material.dart';
import 'package:ui/models/message_model.dart';
import 'package:ui/screens/announcement.dart';
import 'package:ui/screens/calls.dart';
import 'package:ui/screens/chat_screen.dart';
import 'package:ui/screens/forum.dart';
import 'package:ui/screens/home_screen.dart';
import 'package:ui/screens/post_details_page.dart';

import 'package:ui/screens/status_screen.dart';


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    const HomeScreen(),
    StatusPage(),
    PostWidget(),
    announcementScreen(),
    
  
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
        backgroundColor: Colors.white,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue.shade300,
        elevation: 0.0,
        items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.chat),
           title: Text('Chat'),
           backgroundColor: Colors.blue.shade300
           ),
           BottomNavigationBarItem(
           icon: Icon(Icons.group),
           title: Text('Groups'),
           backgroundColor: Colors.blue.shade300
           ),
           BottomNavigationBarItem(
           icon: Icon(Icons.announcement),
           title: Text('Forum'),
           backgroundColor: Colors.blue.shade300
           ),
           BottomNavigationBarItem(
           icon: Icon(Icons.forum),
           title: Text('Announcement'),
           backgroundColor: Colors.blue.shade300
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

