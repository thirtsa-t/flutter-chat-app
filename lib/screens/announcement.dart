import 'dart:ui';
import 'package:ui/base_class.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ui/models/post_list.dart';
import 'package:ui/screens/addannouncement.dart';
import 'package:ui/screens/upload_post_page.dart';
import 'package:ui/models/announcements.dart';
import 'package:dio/dio.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({Key? key}) : super(key: key);

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen>
    with BaseClass {
  List<Announcements> _announcements = [];

  String content =
      "Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter’s hot reload feature helps you quickly and easily experiment, build UIs, add features, and fix bugs. Hot reload works by injecting updated source code files into the running Dart Virtual Machine (VM). After the VM updates classes with the new versions of fields and functions, the Flutter framework automatically rebuilds the widget tree, allowing you to quickly view the effects of your changes.The app updates to reflect your change, and the current state of the app is preserved. Your app continues to execute from where it was prior to running the hot reload command. The code updates and execution continues.";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      loadData();
    });
  }

  void loadData() async {
    var response = await Dio().get("https://klabapp.klabstartupsacademy.rw/api/announcements/");

    print(response.data['data']);
    setState(() {
      _announcements = (response.data['data'] as Iterable)
          .map((announcements) => Announcements.fromJson(announcements))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282d36),
      appBar: AppBar(
        backgroundColor: Color(0xff282d36),
        title: Text("Announcement"),
        centerTitle: true,
        // brightness: Brightness.dark,

        actions: [
          // action button
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UploadAnnouncementPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _announcements.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemBuilder: (context,  index) {

          var announcements = _announcements[index];

          return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff313a4a),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(postList[index].profile),
                                radius: 26,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                  announcements.member_name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    announcements.time,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      announcements.content,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Center(
                    //   child: Container(
                    //     height: 250,
                    //     width: double.maxFinite,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(20),
                    //         // image: DecorationImage(
                    //         //     image: NetworkImage(postList[index].image),
                    //         //     fit: BoxFit.cover)),
                    //   ),

                    // SizedBox(
                    //   height: 15,
                    // ),
                  ]));
        },
      ),
    );
  }
}
