import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ui/screens/addannouncement.dart';
import 'package:ui/screens/upload_post_page.dart';


class announcementScreen extends StatelessWidget {
  String content =
      "Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter’s hot reload feature helps you quickly and easily experiment, build UIs, add features, and fix bugs. Hot reload works by injecting updated source code files into the running Dart Virtual Machine (VM). After the VM updates classes with the new versions of fields and functions, the Flutter framework automatically rebuilds the widget tree, allowing you to quickly view the effects of your changes.The app updates to reflect your change, and the current state of the app is preserved. Your app continues to execute from where it was prior to running the hot reload command. The code updates and execution continues.";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcement"),
      backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        brightness: Brightness.dark,

         actions: [
            // action button
            IconButton(
              icon: Icon( Icons.add ),
              color: Colors.white,
              onPressed: () { 
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadAnnouncementPage()),
             );
              },
            ),
          
          ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ReadMoreText(
            content,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade300,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade300,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}

 