import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    backgroundColor:
    Color(0xFFF282d36);
    return Scaffold(
        backgroundColor: Color(0xFFF282d36),
        appBar: AppBar(
          title: Text(
            "Add Announcement",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
        ),
        body: Center(
            // child: FutureBuilder <List<Data>>(
            // future: futureData,
            // builder: (context, snapshot) {
            //   if (snapshot.hasData) {
            //     List<Data>? data = snapshot.data;
            child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 70,
                //   // child: Image.asset("assets/images/klab.png"),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
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
                //         hintText: 'Enter secure your title'),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _announcement_content,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Content',
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
                        side: BorderSide(color: Colors.white, width: 2)),
                    textColor: Colors.white,
                    child: Text("Change Password"),
                  ),
                ),
              ],
            ),
          ),
        )));
    //  }else if (snapshot.hasError) {
    //       return Text("${snapshot.error}");
    //     }
    //     // By default show a loading spinner.
    //     return CircularProgressIndicator();

    //     }
    //     )
    //     ),

    // );
  }

  Future announcementUser() async {
    // url to registration php script
    print("Submitting");
    var response = await Dio(BaseOptions())
        .post("https://klabapp.klabstartupsacademy.rw/api/announcements/publish",
            data: FormData.fromMap({
              'member_id': "1",
              'announcement_content': 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is'
            }));
    //json maping user entered details

    //send  data using http post to our php code
    print(response);

    if (response.data['code'] == 200) {
      var message = response.data['message'];
      print(message);
    }
  }
}
