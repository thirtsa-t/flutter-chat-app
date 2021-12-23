import 'package:flutter/material.dart';
import 'package:ui/07_profile/changepassword.dart';
import 'package:ui/07_profile/deleteaccount.dart';
import 'package:ui/07_profile/updateprofile.dart';
import 'package:ui/Authentication/login.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool tappedYes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF282d36),

        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 35.0,
                child: Image.asset("assets/images/gentille.jpg"),
              ),
              const SizedBox(height: 6.0),
              const Center(
                child: Text(
                  'Mentor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
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
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(),
                  color: Color(0xff313a4a),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateProfile()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text(
                        "Update Profile",
                        style: TextStyle(
                          color: Color(0xFFF5F6F9),
                        ),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(),
                  color: Color(0xff313a4a),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text("Change password",
                              style: TextStyle(
                                color: Color(0xFFF5F6F9),
                              ))),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(),
                  color: Color(0xff313a4a),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.notification_add_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text("Privacy policy",
                              style: TextStyle(
                                color: Color(0xFFF5F6F9),
                              ))),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(),
                  color: Color(0xff313a4a),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text("Signout",
                              style: TextStyle(
                                color: Color(0xFFF5F6F9),
                              ))),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(),
                  color: Color(0xff313a4a),
                  onPressed: ()async {
          final action =
              await Dialogs.yesAbortDialog(context, 'Delete Account ', 'Are Sure you want to delete the account');
          if (action == DialogAction.yes) {
             setState(() => tappedYes = true);
          } else {
            setState(() => tappedYes = false);
            
          }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text("Delete account",
                              style: TextStyle(
                                color: Color(0xFFF5F6F9),
                              ))),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )))));
  }
}
