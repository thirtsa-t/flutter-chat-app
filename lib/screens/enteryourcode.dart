import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/forgotpasswordscreen.dart';
import 'package:ui/utilities/constants.dart';

class EnterCodecreen extends StatefulWidget {
  const EnterCodecreen({Key? key}) : super(key: key);

  @override
  _EnterCodecreenState createState() => _EnterCodecreenState();
}

class _EnterCodecreenState extends State<EnterCodecreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF282d36),
        appBar: AppBar(
          backgroundColor: Color(0xFFF282d36),
          centerTitle: true,
          title: Text(" Code"),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                   
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
              CircleAvatar(
                radius: 50,
                child: Image.asset("assets/images/klab.png"),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
                child: TextFormField(
                  
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    labelText: 'Enter your Code',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                width: 200,
                height: 50,
                child: RaisedButton(
                  color: const Color(0xff313a4a),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => forgotPasswordScreen()),
                    );
                   
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white, width: 2)),
                  textColor: Colors.white,
                  child: Text("Enter Code"),
                ),
              ),
              SizedBox(height: 50),
            ])))));
  }

 
}
