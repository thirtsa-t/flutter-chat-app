import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui/Authentication/inputdecoration.dart';
import 'package:ui/screens/post_details_page.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({Key? key}) : super(key: key);

  @override
  _UploadPostPageState createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  TextEditingController _member_id = TextEditingController();
  TextEditingController _post_content = TextEditingController();


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
          backgroundColor: Color(0xFFF282d36),
        appBar: AppBar(
           
          title: Text(
            "New post",
            
            style: TextStyle(
              color: Colors.white,
            ),
            
          ),
           centerTitle: true,
          backgroundColor: Color(0xFFF282d36),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              )),
        ),

        
        body: Center(
          child: SingleChildScrollView(
            child: Form(
               key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  // CircleAvatar(
                  //   radius: 70,
                  //   child: Image.asset("assets/images/klab.png"),
                  // ),
                  //  SizedBox(
                  //    height: 15,
                  //  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 10.0, right: 10.0, top: 10, bottom: 0),
                  //   //padding: EdgeInsets.symmetric(horizontal: 15),
                  //   child: TextField(
                       
                  //     decoration: InputDecoration(
                  //        filled: true,

                  //        fillColor: Colors.white,
                  //         border: OutlineInputBorder(),
                  //         labelText: 'title',
                  //         hintText: 'Enter  your title'),
                  //   ),
                  // ),
            Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _post_content,
                     
                    decoration: InputDecoration(
                      
                      filled: true,
                      fillColor:   Color(0xff313a4a),
                      labelText: 'Content',
                       labelStyle: TextStyle(
                        color: Colors.white,
                       ),
                       hintText: 'Enter  your content',
                      
                    ),
                     
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your content";
                      }
                      return null;
                    },
                    onSaved: (post_content) {},
                    minLines: 7,
                    maxLines: 7,
                  ),
                ),
                SizedBox(height: 50),
                
                  Container(
                  width: 400,
                  height: 50,
                  child: RaisedButton(
                    color: const Color(0xff313a4a),
                    onPressed: () {
            
                      if (_formkey.currentState!.validate()) {
                        postUser();
                        print("Successful");
                      } else {
                        print("Unsuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.white, width: 1.5)),
                    textColor: Colors.white,
                    child: Text("Upload"),
                  ),
                ),
                SizedBox(height: 50),
                ],
              ),
            ),
          ),
        )
        );
  }

    
 
 

  Future postUser() async {
    // url to registration php script
      print("Submitting");
    var response = await Dio(BaseOptions())
        .post("https://klabapp.klabstartupsacademy.rw/api/forum/addPost",
            data: FormData.fromMap({
              'member_id': "2",
              'post_content': _post_content.text,
            }));
    //json maping user entered details

    //send  data using http post to our php code
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
                CupertinoPageRoute(builder: (context) => PostWidget ()));
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) =>PostWidget()));
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
  
  

