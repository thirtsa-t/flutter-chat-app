import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/Authentication/login.dart';
import 'inputdecoration.dart';
import 'package:http/http.dart' as http;


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
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
      child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
            
                CircleAvatar(
                  radius: 50,

                  child: Image.asset("assets/images/klab.png"),
                ),
                const SizedBox(
                  height: 15,
                ),
              const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0,bottom: 20.0),

                        child: Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(78, 53, 43, 1.0),
                              fontSize: 40.0,                            
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
               Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _fname,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "First Name"),
                    validator: ( value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter first name";
                      }
                      return null;
                    },
                    onSaved: (fname) {},
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _lname,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Last Name"),
                    validator: ( value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter ypur lastname";
                      }
                      return null;
                    },
                    onSaved: (lname) {},
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
                    obscureText: true,
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
            //              Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SigninScreen()),
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
                    child: Text("Submit"),
                  ),
                ),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("Don't have an account?",
                   style: TextStyle(color: Colors.black),
                   ),
                   FlatButton(
                     onPressed: () {
                         Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => SigninScreen()),
             );
                     },
                     child:Text(
                       "LOGIN",
                       style: TextStyle(
                         color: Colors.lightBlue[200],
                         fontWeight: FontWeight.bold
                       ),
                                      
                       ) )
                   
              ],
            ),
              ]
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
        'klabchat.devslab.io', '/api/members/register', {'q': '{http}'});

    //json maping user entered details
    Map mapeddate = {
      'category_id': "1",
      'member_fname': _fname.text,
      'member_lname': _lname.text,
      'member_email': _email.text,
      'member_phone': _phone.text,
      'member_password': _password.text
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(url, body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");


    if(data["code"] ==200)
      {
        var message = data["message"];
        print(message);

        final snackBar = SnackBar(
          content: Text(message),
          action: SnackBarAction(
            label: 'Signin',
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context)=> SigninScreen()));
            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(context, CupertinoPageRoute(builder: (context)=> SigninScreen()));

      }else{
      var message = data["message"];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {

          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }



  }
}