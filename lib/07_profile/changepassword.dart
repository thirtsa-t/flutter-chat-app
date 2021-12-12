import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
           backgroundColor:  Color(0xFFF282d36),
      appBar: AppBar(
        backgroundColor:  Color(0xFFF282d36),
         centerTitle: true,
        title: Text("change Password"),
      ),
        body: ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
          color: Color(0xff313a4a),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                "Current Password",
                style: TextStyle(
                  color: Color(0xFFF5F6F9),
                ),
              )),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
         color: Color(0xff313a4a),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                "New Password",
                style: TextStyle(
                  color: Color(0xFFF5F6F9),
                ),
              )),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(),
          color: Color(0xff313a4a),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                "Confirm Password",
                style: TextStyle(
                  color: Color(0xFFF5F6F9),
                ),
              )),
            ],
          ),
        ),
      ),
    ]
    )
    );
  }
}
