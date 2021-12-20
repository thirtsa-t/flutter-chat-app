import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui/screens/announcement.dart';
import 'package:ui/screens/bottom_nav_screen.dart';

Future<List<Data>> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://klabapp.klabstartupsacademy.rw/api/announcements/'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    var data = jsonDecode(response.body);

    print(data);

    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  final String member_id;

  final String announcement_content;

  Data({required this.member_id, required this.announcement_content});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      member_id: json['member_id'],
      announcement_content: json['announcement_content'],
    );
  }
}

class UploadAnnouncementPage extends StatefulWidget {
  const UploadAnnouncementPage({Key? key}) : super(key: key);

  @override
  _UploadAnnouncementPageState createState() => _UploadAnnouncementPageState();
}

class _UploadAnnouncementPageState extends State<UploadAnnouncementPage> {
  TextEditingController _member_id = TextEditingController();
  TextEditingController _announcement_content = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor:Color(0xFFF282d36);
    return Scaffold(
      backgroundColor:Color(0xFFF282d36),
        
        appBar: AppBar(
          title: Text(
            "Add Announcement",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        
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
              children: [
              
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _announcement_content,
                     
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
                    onSaved: (announcement_content) {},
                    minLines: 7,
                    maxLines: 7,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: const Color(0xff313a4a),
                    onPressed: () { 
                      if (_formkey.currentState!.validate()) {
                        announcementUser();
                        print("Successful");
                      } else {
                        print("Unsuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                       ),
                    
                    
                    child: Text("Upload",
                    style: TextStyle(color: Colors.white),
                    ),
                    
                  ),
                ),
              ],
            ),
          ),
        )));
   
  }

  Future announcementUser() async {
    // url to registration php script
    print("Submitting");
    var response = await Dio(BaseOptions())
        .post("https://klabapp.klabstartupsacademy.rw/api/announcements/publish",
            data: FormData.fromMap({
              'member_id': "1",
              'announcement_content': _announcement_content.text,
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
                CupertinoPageRoute(builder: (context) => AnnouncementsScreen ()));
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) =>AnnouncementsScreen()));
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
  
  

