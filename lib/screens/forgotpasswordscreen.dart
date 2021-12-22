import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/Authentication/inputdecoration.dart';
import 'package:ui/Authentication/login.dart';
import 'package:ui/utilities/constants.dart';

class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _forgotPasswordScreenState createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  TextEditingController _member_id = TextEditingController();
  TextEditingController _new_password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF282d36),
        appBar: AppBar(
          backgroundColor: Color(0xFFF282d36),
          centerTitle: true,
          title: Text("Forgot Password"),
        ),
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
                          Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: _new_password,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                            Icons.lock, "New Password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter re-password";
                          }
                          
                          
                          return null;
                        },
                      ),
                    ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            width: 200,
                            height: 50,
                            child: RaisedButton(
                              color: const Color(0xff313a4a),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SigninScreen()),
                                // );
                                if (_formkey.currentState!.validate()) {
                            ForgotPasswordUser();
                            print("Successful");
                          } else {
                            print("Unsuccessfull");
                          }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(
                                      color: Colors.white, width: 2)),
                              textColor: Colors.white,
                              child: Text("Re-set Password"),
                            ),
                          ),
                          SizedBox(height: 50),
                        ])))));
  }
   Future  ForgotPasswordUser()async {
    // url to registration php script
    print("submitting");
    // print(_phone);
    var response = await Dio(BaseOptions()).post(
        "https://klabapp.klabstartupsacademy.rw/api/reset_password/newPassword.php",
        data: FormData.fromMap({
          'member_id': '7',
        'new_password': _new_password.text
        }));
    print(response);

    if (response.data['code'] == 200) {
      var message = response.data['message'];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'checkmsg',
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => SigninScreen()));
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => SigninScreen()));
    } else {
      var message = response.data['message'];
      print(message);

      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'checkmsg',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

