import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/screens/status_screen.dart';
import 'package:ui/screens/status_screen.dart';
import 'package:ui/widgets/category_selector.dart';
import 'package:ui/widgets/favorite_contacts.dart';
import 'package:ui/widgets/recent_charts.dart';
import 'package:ui/screens/group_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Image.asset('assets/logos/logo1.jpg',
              fit: BoxFit.contain, height: 42),
          toolbarHeight: 68,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                iconSize: 30.0,
                color: Colors.black,
                onPressed: () {}),
            PopupMenuButton<String>(onSelected: (value) {
            
              // ignore: avoid_print
              print(value);
            }, 
            icon: Icon(Icons.more_vert, color: Colors.black,),
            itemBuilder: (BuildContext context) {
             return [
                const PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                const PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                const PopupMenuItem(
                  child: Text("KLab web"),
                  value: "Klab Web",
                ),
                const PopupMenuItem(
                  child: Text("Starred messsages"),
                  value: "Starred messages",
                ),
                const PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            })
          ],
        ),
        
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                height: 300.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    FavoriteContacts(),
                    RecentChats(),
//                        Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed:(){
//            Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (_) => StatusPage()),
//   );
                    
// } 
//       ),
//                        ),
                  ],
                  
                  
                )
       
              ),
            ),
          ],
        ));
  }
}
