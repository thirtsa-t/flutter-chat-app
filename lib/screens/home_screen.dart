
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/models/group_model.dart';
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
        backgroundColor: Colors.white,     
        leading: IconButton(
          icon:Icon(Icons.menu),
        iconSize: 30.0,
        
        color: Colors.black,
        
        onPressed: () {
  
        },
        ),
        
         
    
        title: Text('KLabchats',
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,

        ),
        ),
        
        elevation: 0.0,
        actions: <Widget>[
         Image.asset('assets/logos/logo1.jpg'),
          // Image.network('https://klab.rw/sitestatic/images/logo.jpg'),
           IconButton(
          icon:Icon(Icons.search),
            iconSize: 30.0,
           color: Colors.black,
            onPressed: () {
      
  
            }
        ),
        ],
      ),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
            child:Container(
              height: 500.0,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                ),
                child: Column(
                  children: <Widget>[
                    FavoriteContact(),
                   RecentChats(),
                  ],
                  ),
                  
                ),
            ),
          ],
        ) 
    );
  }
}