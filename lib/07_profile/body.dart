import 'package:flutter/material.dart';
import 'package:ui/07_profile/changepassword.dart';
import 'package:ui/07_profile/profilepic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ProfilePic(),
      SizedBox(height:20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
           color: Color(0xFFF282d36),

        onPressed: () {
            
        }, 
      child: Row(
        children: [
          Icon(
      Icons.person,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: 
      Text("Update Profile",
      style:TextStyle(color: Color(0xFFF5F6F9),
      ), 
      )
      ),
      Icon(Icons.arrow_forward_ios)
        ],
        ),
        ),
      ),
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
         color: Color(0xFFF282d36),

        onPressed: () {
          Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => ChangePassword()));
        }, 
      child: Row(
        children: [
          Icon(
      Icons.lock,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: Text("Change password",
      style: TextStyle(color: Color(0xFFF5F6F9),
      )
      )
      ),
      Icon(Icons.arrow_forward_ios)
        ],
        ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
          color: Color(0xFFF282d36),

        onPressed: () {}, 
      child: Row(
        children: [
          Icon(
      Icons.notification_add_rounded,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: Text("Privacy policy",
      style:TextStyle(color: Color(0xFFF5F6F9),)
      )
      ),
      Icon(Icons.arrow_forward_ios)
        ],
        ),
        ),
      ),
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
         color: Color(0xFFF282d36),

        onPressed: () {}, 
      child: Row(
        children: [
          Icon(
      Icons.logout,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: Text("Signout",
      style:TextStyle(color: Color(0xFFF5F6F9),)
      )
      ),
      Icon(Icons.arrow_forward_ios)
        ],
        ),
        ),
      ),
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
         color: Color(0xFFF282d36),

        onPressed: () {}, 
      child: Row(
        children: [
          Icon(
      Icons.delete,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: Text("Delete account",
      style: TextStyle(color: Color(0xFFF5F6F9),)
      )
      ),
      Icon(Icons.arrow_forward_ios,
      )
        ],
        ),
        ),
      ),
      ],
    );
  }
}

