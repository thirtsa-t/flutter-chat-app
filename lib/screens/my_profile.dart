import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/Authentication/login.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
         backgroundColor: Color(0xff282d36),
        centerTitle: true,
          ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
             CircleAvatar(
                 radius: 35.0,

                  child: Image.asset("assets/images/sam.jpg"),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                      child: Text(
                          'Mentor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(78, 53, 43, 1.0),
                              fontSize: 20.0,                            
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    
                    const Center(
                      // child: Padding(
                        // padding: EdgeInsets.only(top: 40.0,bottom: 40.0),
                         child: Text(
                          '0783845574.@Mentor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(78, 53, 43, 1.0),
                              fontSize: 10.0,                            
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    
            
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Update profile"),
            buildAccountOptionRow(context, "Change password"),
           buildAccountOptionRow(context, "Privacy and security"),
           buildAccountOptionRow(context, "Delete Account"),
            
            
            SizedBox(
              height: 40,
            ),
            
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                   Navigator.push(context, CupertinoPageRoute(builder: (context)=> SigninScreen()));
                },
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Color(0xff282d36))),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Row buildNotificationOptionRow(String title, bool isActive) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         title,
  //         style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.w500,
  //             color: Colors.grey[600]),
  //       ),
  //       Transform.scale(
  //           scale: 0.7,
  //           child: CupertinoSwitch(
  //             value: isActive,
  //             onChanged: (bool val) {},
  //           ))
  //     ],
  //   );
  // }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  
}