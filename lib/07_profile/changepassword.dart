

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/07_profile/body.dart';
import 'package:ui/07_profile/updateprofile.dart';
import 'package:ui/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:ui/screens/bottom_nav_screen.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
   TextEditingController _member_id = TextEditingController();

  TextEditingController _current_password = TextEditingController();

  TextEditingController _new_password= TextEditingController();

   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
           backgroundColor:  Color(0xFFF282d36),
      appBar: AppBar(
        backgroundColor:  Color(0xFFF282d36),
         centerTitle: true,
        title: Text("change Password"),
      ),
        body: Center(
      child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
            
            
      
          Container(
             margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child:  TextFormField(
                 controller: _current_password,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
             
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your Current Password',
                  hintStyle: kHintTextStyle,
                ),
                validator: (value) {
                 if (value == null || value.isEmpty) {
                    return "Please enter your current password";
                  }

                  return null;
                },
                 onSaved: (current_password) {},
              ),
            ),
        
      
      Container(
             margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                 controller: _new_password,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    
                    color: Colors.white,
                  ),
                  hintText: 'Enter your new Password',
                  hintStyle: kHintTextStyle,
                
                ),
                validator: (value) {
                 if (value == null || value.isEmpty) {
                    return "Please your new password";
                  }

                  return null;
                },
                 onSaved: (new_password) {},
              ),
            ),
        
        //      Container(
        //         margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
        //           padding:
        //               EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        //   alignment: Alignment.centerLeft,
        //   decoration: kBoxDecorationStyle,
        //   height: 60.0,
        //   child: TextField(
        //     keyboardType: TextInputType.emailAddress,
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontFamily: 'OpenSans',
        //     ),
        //     decoration: InputDecoration(
        //       border: InputBorder.none,
        //       contentPadding: EdgeInsets.only(top: 14.0),
        //       prefixIcon: Icon(
        //         Icons.lock,
        //         color: Colors.white,
        //       ),
        //       hintText: 'Enter your Confirmed Password',
        //       hintStyle: kHintTextStyle,
        //     ),
        //   ),
        // ),
                         Container(
                           margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  width: 200,
                  height: 50,
                  
                  child: RaisedButton(
                    color:const Color(0xff313a4a),
                    onPressed: () {


                       if (_formkey.currentState!.validate()) {
                        ChangePasswordUser();
                        print("Successful");
                      } else {
                        print("Unsuccessfull");
                      }
                    },
                    
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.white, width: 2)),
                    textColor: Colors.white,
                    child: Text("Change Password"),
                  ),
                ),
              ],
            ),
          
      
            
          
        
      
          )
      )
        )
    
    );
  

  }

   Future ChangePasswordUser() async {
    // url to registration php script
    print("submitting");
    // var url = Uri.http(
    //     'klabapp.klabstartupsacademy.rw', '/api/members/register.php', {'q': '{http}'});

    // //json maping user entered details
    // Map mapeddate = {
    //   'category_id': "1",
    //   'member_fname': _fname.text,
    //   'member_lname': _lname.text,
    //   'member_email': _email.text,
    //   'member_phone': _phone.text,
    //   'member_password': _password.text
    // };
    // //send  data using http post to our php code
    // http.Response reponse = await http.post(url, body: mapeddate);

    //getting response from php code, here
   var response = await Dio(BaseOptions(
    )).post("https://klabapp.klabstartupsacademy.rw/api/profile/changePassword",data: FormData.fromMap({
 'member_id': '4',
  'current_password': _current_password.text,
  'new_password': _new_password.text,
    }));
     print(response);

     if (response.data['code'] == 200) {
      var message = response.data['message'];
      print(message);


         final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'password changed',
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => Body()));
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) =>Body()));
    } else {
      var message =  response.data['message'];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Update profile',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
  
  


