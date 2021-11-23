 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/profile_page.dart';
import 'package:ui/screens/upload_post_page.dart';
import 'package:ui/screens/post_details_page.dart';
 
 
 class ForumScreen extends StatefulWidget {
 
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {

 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Text("Blog App",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,),
        ),
         actions: [
            // action button
            IconButton(
              icon: Icon( Icons.add ),
              color: Colors.black,
              onPressed: () { 
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadPostPage()),
             );
              },
            ),
          
          ],
          leading: IconButton(
            icon: Icon( Icons.person ),
            color: Colors.black,
            onPressed: () { 
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
             );
            },
          ),
          ),


                          body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Container(
          //   color:Colors.white,
          //   height: 150,
          //   child: Column(
          //      mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       FlutterLogo(size: 50,),
          //       SizedBox(height: 20,),                Text("KlAB App",style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18
          //       ),
          //       ),
          //       Text("thirtsaisimbi@gmail.com",style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 15
          //       ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 20,),
          // Text("Your Post", style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   fontSize: 18,
          // ),),
          // SizedBox(height: 20,),
        
                  
     
              posts(),
              posts(),
              posts(),
              posts(),
              posts(),
              posts(),
              
        ]
                )
       );
    
    }
}