import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/Authentication/signup.dart';
import 'package:ui/screens/bottom_nav_screen.dart';
import 'inputdecoration.dart';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF282d36),
      body: Center(
        
        child: SingleChildScrollView(
          
          child: Form(
            key: _formkey,
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
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                      
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    
                    decoration: buildInputDecoration(Icons.email, "Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter  email";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    onSaved: (email) {},
                  ),
                  
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    
                    controller: _password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                    
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: RaisedButton(
                    color: const Color(0xFF2B5894),
                    onPressed: () {
                      //              Navigator.push(
                      //  context,
                      //   MaterialPageRoute(builder: (context) => BottomNavScreen()),
                      // );
                      if (_formkey.currentState!.validate()) {
                        RegistrationUser();
                        print("Successful");
                      } else {
                        print("Unsuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Signin"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.lightBlue[200],
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future RegistrationUser() async {
    // url to registration php script
    print("submitting");

    // var url = Uri.http(
    //     'klabapp.klabstartupsacademy.rw', '/api/members/login.php', {'q': '{https}'});
    //
    // //json maping user entered details
    // Map mapeddate = {'email': _email.text, 'password': _password.text};
    // //send  data using http post to our php code
    // http.Response reponse = await http.post(url, body: mapeddate);
    //

    // new codes
    var response = await Dio(BaseOptions(
    )).post("https://klabapp.klabstartupsacademy.rw/api/members/login.php",
    data: FormData.fromMap({
      "email": _email.text,
      "password": _password.text,
    }));

    // end new codes

    //getting response from php code, here
    //var data = jsonDecode(response.body);
    print(response);

    if (response.data['code'] == 200) {
      var message = response.data['message'];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Signin',
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => BottomNavScreen()));
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => BottomNavScreen()));
    } else {
      var message =  response.data['message'];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Signin',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

// class Status {}
