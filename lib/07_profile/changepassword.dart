import 'package:flutter/material.dart';
import 'package:ui/utilities/constants.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
           backgroundColor:  Color(0xFFF282d36),
      appBar: AppBar(
        backgroundColor:  Color(0xFFF282d36),
         centerTitle: true,
        title: Text("change Password"),
      ),
        body: ListView(children: <Widget>[
      
          Container(
             margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your Current Password',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
        
      
      Container(
         margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your New Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
             Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Confirmed Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
                         Container(
                           margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  width: 200,
                  height: 50,
                  
                  child: RaisedButton(
                    color:const Color(0xff313a4a),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.white, width: 2)),
                    textColor: Colors.white,
                    child: Text("Change Password"),
                  ),
                ),
              ],
            ),
          
      
            
          
        
      
    
    
    );
  

  }
}
