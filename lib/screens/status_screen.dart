import 'package:flutter/material.dart';
import 'package:ui/Customui/headownstatus.dart';
import 'package:ui/Customui/otherstatus.dart';
import 'package:ui/screens/status_screen.dart';
import 'package:ui/widgets/favorite_contacts.dart';


class StatusPage extends StatefulWidget {
  // const StatusPage(String s, { Key? key }) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          // backgroundColor: Colors.red,
          title: Image.asset('assets/logos/logo1.jpg',
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height:48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(Icons.edit,color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            elevation: 5, 
            child: Icon(Icons.camera_alt),
          ),
           SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            elevation: 5, 
            child: const Icon(Icons.audiotrack,
          ),
           


          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          FavoriteContacts(),
          // SizedBox(
          //   height: 10,
          // ),
          HeadOwnStatus(),
          label("Recent Update"),
          
           OtherStatus(
            name: "steven",
             imageName: "assets/images/steven.jpg",
             time: "02:23",
              isSeen: false,
             statusNum: 15,
           ),
          OtherStatus(
             name: "gentille",
            imageName: "assets/images/gentille.jpg",
             time: "05:23",
             isSeen: false,
             statusNum: 2,
          ),
           OtherStatus( 
            name: "sam",
            imageName: "assets/images/sam.jpg",
            time: "03:23",
             isSeen: false,
             statusNum: 3,
           ),
           SizedBox(
             height: 10,
           ),
           label("Viewed updates"),
              OtherStatus(
            name: "john",
             imageName: "assets/images/john.jpg",
             time: "02:23",
              isSeen: true,
             statusNum: 10,
           ),
          OtherStatus(
             name: "thirtsa",
            imageName: "assets/images/thirtsa.jpg",
             time: "05:23",
              isSeen: true,
             statusNum: 1,
          ),
           OtherStatus( 
            name: "sam",
            imageName: "assets/images/sam.jpg",
            time: "03:23",
             isSeen: true,
             statusNum: 1,
           ),
        ],
        ),

      ),
    );
  }
  Widget label(String labelname) {
    return Container(
    
            height: 33,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: Padding(
              padding: 
              const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
            
            child: Text(
              labelname,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          );
  }
}


