import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
          child: SingleChildScrollView(
            child: Form(
               
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
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
      Icons.lock,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: 
      Text("Current Password",
      style:TextStyle(color: Color(0xFFF5F6F9),
      ), 
      )
      ),
     
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
      Icons.lock,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: 
      Text("New Password",
      style:TextStyle(color: Color(0xFFF5F6F9),
      ), 
      )
      ),
      
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
      Icons.lock,
      color: Colors.white,
      size: 30.0,),
      SizedBox(width: 20),
      Expanded(child: 
      Text("Confirm Password",
      style:TextStyle(color: Color(0xFFF5F6F9),
      ), 
      )
      ),
     
        ],
        ),
        ),
      ),
                ]
              )
            )
          )
       )
    
    );
  }
}
