import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/Authentication/signup.dart';
import 'package:ui/screens/bottom_nav_screen.dart';
import 'package:ui/screens/forgotpasswordscreen.dart';
import 'package:ui/screens/sendcodescreen.dart';
import 'package:ui/utilities/constants.dart';
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
      backgroundColor: Color(0xFFF282d36),
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
                SizedBox(height: 30),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: RaisedButton(
                    color: const Color(0xff313a4a),
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
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xff313a4a), width: 1.5)),
                    textColor: Colors.white,
                    child: Text("Signin"),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => sendcodescreen()),
                      );
                    },
                    // padding: EdgeInsets.only(bottom: 30, left: 10, right: 10),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                // const Text(
                //   "  OR  ",
                //   style: TextStyle(
                //       color: Colors.white, fontWeight: FontWeight.bold),
                // ),
                Row(children: const <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 10.0,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 20.0,
                      thickness: 1,
                    ),
                  ),
                ]),
                
                SizedBox(height: 10),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: RaisedButton(
                    color: const Color(0xff313a4a),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                      if (_formkey.currentState!.validate()) {
                        RegistrationUser();
                        print("Successful");
                      } else {
                        print("Unsuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xff313a4a), width: 1.5)),
                    textColor: Colors.white,
                    child: Text("Create Account"),
                  ),
                ),
                SizedBox(height: 50),
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
    var response = await Dio(BaseOptions())
        .post("https://klabapp.klabstartupsacademy.rw/api/members/login.php",
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
      var message = response.data['message'];
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
