import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/Authentication/inputdecoration.dart';
import 'package:ui/screens/forgotpasswordscreen.dart';
import 'package:ui/utilities/constants.dart';

class EnterCodecreen extends StatefulWidget {
  const EnterCodecreen({Key? key}) : super(key: key);

  @override
  _EnterCodecreenState createState() => _EnterCodecreenState();
}

class _EnterCodecreenState extends State<EnterCodecreen> {
    TextEditingController _phone = TextEditingController();
  TextEditingController _code = TextEditingController();


 final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF282d36),
        appBar: AppBar(
          backgroundColor: Color(0xFFF282d36),
          centerTitle: true,
          title: Text(" Code"),
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
                              controller: _phone,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration:
                              buildInputDecoration(Icons.phone, "phone No"),
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
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 10, right: 10),
                            child: TextFormField(
                              controller: _code,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration:
                              buildInputDecoration(Icons.phone, "code No"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter  code";
                                }
                               
                                
                                return null;
                              },
                              onSaved: (code) {},
                            ),
                          ),
              Container(
                margin: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                width: 200,
                height: 50,
                child: RaisedButton(
                  color: const Color(0xff313a4a),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => forgotPasswordScreen()),
                    // );
                    if (_formkey.currentState!.validate()) {
                                  SendCodeUser();
                                  print("Successful");
                                } else {
                                  print("Unsuccessfull");
                                }
                   
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white, width: 2)),
                  textColor: Colors.white,
                  child: Text("Enter Code"),
                ),
              ),
              SizedBox(height: 50),
            ])))));
  }
 Future SendCodeUser() async {
    // url to registration php script
    print("submitting");
    // print(_phone);
    var response = await Dio(BaseOptions()).post(
        "https://klabapp.klabstartupsacademy.rw/api/reset_password/verify.php",
        data: FormData.fromMap({
          'member_phone': _phone.text,
          'code': _code.text

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
                    builder: (context) => forgotPasswordScreen()));
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => forgotPasswordScreen()));
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

 

