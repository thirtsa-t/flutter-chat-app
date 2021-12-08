import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/screens/selectcontact.dart';

import 'package:ui/widgets/category_selector.dart';
import 'package:ui/widgets/favorite_contacts.dart';
import 'package:ui/widgets/recent_charts.dart';
import 'package:ui/screens/group_screen.dart';


 



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}


class _HomeScreen extends State<HomeScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;

   @override
  void initState() {
    _tabController = new TabController(length: 4, initialIndex: 1, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }
 
 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
          // backgroundColor: Colors.red,
          title: Image.asset('assets/images/klab.png',
              fit: BoxFit.contain, height: 42),
              
          toolbarHeight: 68,
          
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {}),
            PopupMenuButton<String>(onSelected: (value) {
            
              // ignore: avoid_print
              print(value);
            }, 
            icon: Icon(Icons.more_vert, color: Colors.white),
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
            
            }
            )
          ],
      ),
      
      
     
      //     bottom: TabBar(
      //      controller: _controller,
      //     indicatorColor: Colors.white,
      //     tabs: [
      //       Tab(
      //         icon: Icon(Icons.camera_alt),
      //       ),
      //       Tab(
      //         text: "CHATS",
      //       )
      //       Tab(
      //         text: "STATUS",
      //       ),
      //       Tab(
      //         text: "CALLS",
      //       )
      //     ],
      //   ),
      //   ),
      
      // body: TabBarView(
      //   controller: _controller,
      //   children: [
          
          
      //     Text("STATUS"),
      //     Text("Calls"),
      //   ],
      // ),
    
        
        body: Column(
          children: <Widget>[
            // CategorySelector(
               
            // ),
             
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
//                                           Container(
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
        ),
        floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height:48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectContacts()),
             );
              },
              child: Icon(Icons.chat,color: Colors.blueGrey[900],
              ),
            ),
          ),
        ]
        ),
        );
  }
}
