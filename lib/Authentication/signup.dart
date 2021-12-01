import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/Authentication/login.dart';
import 'inputdecoration.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
       body: Center(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,

                  child: Image.asset("assets/images/klab.png"),
                ),
                SizedBox(
                  height: 15,
                ),
               Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Full Name"),
                    validator: ( value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                    onSaved: (name) {},
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.email, "Email"),
                    validator: ( value) {
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
                    controller: _phone,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.phone, "Phone No"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter  phone";
                      }
                      if (value.length < 10) {
                        return "Please enter valid phone";
                      }
                      return null;
                    },
                    onSaved: (phone) {},
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:
                    buildInputDecoration(Icons.lock, "Confirm Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter re-password";
                      }
                      if (_password.text != _confirmpassword.text) {
                        return "Password Do not match";
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
                         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
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
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
         )
    );
  }

  Future RegistrationUser() async {
    // url to registration php script
    print("submitting");
    var url = Uri.http(
        'localhost', '/Klabchat/api/members/register.php', {'q': '{http}'});

    //json maping user entered details
    Map mapeddate = {
      'category_id': "1",
      'member_fname': _name.text,
      'member_lname': _name.text,
      'member_email': _email.text,
      'member_phone': _phone.text,
      'password': _password.text
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(url, body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");

  }
}
