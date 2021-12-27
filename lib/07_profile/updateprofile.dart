import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/07_profile/body.dart';
import 'package:ui/utilities/constants.dart';

class UpdateProfile extends StatefulWidget {

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
   TextEditingController _fname = TextEditingController();

  TextEditingController _lname = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _phone = TextEditingController();

   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF282d36),
      appBar: AppBar(
        backgroundColor: Color(0xFFF282d36),
        centerTitle: true,
        title: Text("Update Profile"),
      ),
       body: Center(
      child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
            
            
          Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              controller: _fname,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your New Name',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                 if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }

                  return null;
                },
                 onSaved: (fname) {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
           child: TextFormField(
              controller: _lname,
              
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your New Name',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                 if (value == null || value.isEmpty) {
                    return "Please enter your last name";
                  }

                  return null;
                },
                 onSaved: (lname) {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              controller: _email,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your email',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                 if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }

                  return null;
                },
                 onSaved: (email) {},
            ),
          ),
            Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              controller: _phone,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your phone',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                 if (value == null || value.isEmpty) {
                    return "Please enter your phone";
                  }

                  return null;
                },
                 onSaved: (phone) {},
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
                        UpdateProfileUser();
                        print("Successful");
                      } else {
                        print("Unsuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xff313a4a), width: 1.5)),
                    textColor: Colors.white,
                    child: Text("Update"),
                  ),
                ),
        ],
      ),
          )
      )
       )
    );
  }

  Future UpdateProfileUser() async {
    // url to registration php script
    print("submitting");
   
    var response = await Dio(BaseOptions()).post(
        "https://klabapp.klabstartupsacademy.rw/api/profile/updateProfile",
        data: FormData.fromMap({
         'member_id': '5',
  'member_fname': _fname.text,
  'member_lname': _lname.text,
  'member_email': _email.text,
  'member_phone': _phone
        }));
    print(response);

    if (response.data['code'] == 200) {
      var message = response.data['message'];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'password changed',
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => Body()));
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => Body()));
    } else {
      var message = response.data['message'];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Update',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}


