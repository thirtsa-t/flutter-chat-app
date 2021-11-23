
// ignore_for_file: unused_element

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ui/Authentication/Methods.dart';
// import 'package:ui/Authentication/login.dart';
// import 'package:ui/screens/home_screen.dart';
// import 'package:ui/utilities/constants.dart';



// class CreateAccount extends StatefulWidget {
//   const CreateAccount({ Key? key }) : super(key: key);

//   @override
//   _CreateAccountState createState() => _CreateAccountState();
// }

// class _CreateAccountState extends State<CreateAccount> {
//   final TextEditingController _name = TextEditingController();
//     final TextEditingController _email = TextEditingController();
//       final TextEditingController _password = TextEditingController();
//       bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     final size =MediaQuery.of(context).size;
//     return Scaffold(
//       body: isLoading
//       ? Center(
//         child: Container(
//           height: size.height / 20 ,
//           width: size.height/ 20,
//           child: CircularProgressIndicator(),
//           ),
//       )
//            : SingleChildScrollView(
//         child: Column(
//       children: [
//         SizedBox(
//           height: size.height / 20,
//         ),
//         Container(
//             alignment: Alignment.centerLeft,
//             width: size.width / 0.5,
//             child:
//                 IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
//                 ),
//         SizedBox(
//           height: size.height / 50,
//         ),
//         Container(
//           width: size.width / 1.1,
//           child: Text(
//             "welcome to KLab",
//             style: 
//             TextStyle(
//               fontSize: 34, 
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//          Container(
//            width: size.width / 1.1,
//            child: Text("Create Account to continue",
//             style: TextStyle(color: Colors.grey[700],
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//             ),
//             ),
//          ),
//          SizedBox(
//            height: size.height / 20,
//          ),
//           Padding(
//            padding: const EdgeInsets.symmetric(vertical: 18.0),
//          child:Container(
//            width: size.width,
//            alignment: Alignment.center,
//            child: field(size, "Name", Icons.account_box, _name),
//          ),
//          ),
//          Container(
//            width: size.width,
//            alignment: Alignment.center,
//            child: field(size, "Email", Icons.account_box, _email),
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical:18.0),
//            child:Container(
//            width: size.width,
//            alignment: Alignment.center,
//            child: field(size, "password", Icons.lock, _password),
//            ),
//          ),
//          SizedBox(
//            height: size.height / 20,
//          ),
//          customButton(size),
//         Padding(
//           padding:const EdgeInsets.all(8.0),
//           child: GestureDetector(
//           onTap: () => Navigator.pop(context),
//            child: Text(
//            "LogIn",
//            style:TextStyle(
//              color: Colors.blueGrey,
//                  fontSize: 16,
//                  fontWeight: FontWeight.w500,
//                      ),
//                      ),
//           ),
//         ),
//       ],
//     ),
//       ),
//     );
//   }
//     Widget customButton(Size size) {
//   return GestureDetector(
//     onTap: () {
//       if(_name.text.isNotEmpty && 
//       _email.text.isNotEmpty && 
//       _password.text.isNotEmpty) {
//  setState(() {
//    isLoading = true;
//  });
//  createAccount(_name.text, _email.text, _password.text).then((user) {
//    if (user !=null) {
//      setState(() {
//        isLoading = false;
//      });
//      Navigator.push(
//        context,MaterialPageRoute(builder: (_) => HomeScreen()));
//      print(
//        "Account Created Successfull");
//    } else {
//      print("Login Failed");
//      setState(() {
//        isLoading = false;
//      });
//    }
//    });
 
//       }else {
//         print("please enter Fields");
//       }
//     },
//     child: Container(
//     height: size.height /14,
//     width: size.width /1.2,
//    decoration:BoxDecoration(
//      borderRadius: BorderRadius.circular(5),
//      color: Colors.blueGrey,
//    ),
// alignment: Alignment.center,
//     child: Text(
//       "Create Account", 
//       style: TextStyle(
//         color: Colors.white,
//          fontSize:18,
//          fontWeight: FontWeight.bold,
//     ),
//   ),
//     ),
//   );
// }
//   Widget field(Size size, String hintText, IconData icon, TextEditingController cont){
//     return Container(
//       height: size.height / 14,
//       width: size.width / 1.1,
//       child: TextField(
//         controller: cont,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon),
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.grey),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10))
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ui/Authentication/login.dart';
import 'package:ui/screens/home_screen.dart';
import 'package:ui/screens/bottom_nav_screen.dart';
//import http package manually

class RegisterScreen extends StatefulWidget{
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'male',
      'label': 'Male',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': 'female',
      'label': 'Female',
      // 'icon': Icon(Icons.fiber_manual_record),
      // 'textStyle': TextStyle(color: Colors.red),
    },
  ];
  @override
  State<StatefulWidget> createState() {
     return _RegisterScreen();
  }
}



class _RegisterScreen extends State<RegisterScreen>{
  late String errormsg;
  late bool error, showprogress;
  late String username, password;

  final _username = TextEditingController();
  final _password = TextEditingController();

  startLogin() async {
   
     String apiurl = "http://localhost/php/login.php"; //api url
     //dont use http://localhost , because emulator don't get that address
     //insted use your local IP address or use live URL
     //hit "ipconfig" in windows or "ip a" in linux to get you local IP
     // ignore: avoid_print
     print(username);

     var response = await http.post(Uri.parse(apiurl), 
     headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",},
        body: {
        'username': username, //get the username text
        'password': password  //get password text
     });
       
     if(response.statusCode == 200){
       
         var jsondata = json.decode(response.body);
         if(jsondata["error"]){
             setState(() {
                 showprogress = false; //don't show progress indicator
                 error = true;
                 errormsg = jsondata["message"];
             });
         }else{
            if(jsondata["success"]){
               setState(() {
                  error = false;
                  showprogress = false;
               });
               //save the data returned from server
               //and navigate to home page
              //  String uid = jsondata["uid"];
              //  String fullname = jsondata["fullname"];
              //  String address = jsondata["address"];
              //  print(fullname);
               //user shared preference to save data
            }else{
               showprogress = false; //don't show progress indicator
               error = true;
               errormsg = "Something went wrong.";
            }  
         }
     }else{
        setState(() {
           showprogress = false; //don't show progress indicator
           error = true;
           errormsg = "Error during connecting to server.";
        });
     }
  }

  @override
  void initState() {
     username = "";
     password = "";
     errormsg = "";
     error = false;
     showprogress = false;

     //_username.text = "defaulttext";
     //_password.text = "defaultpassword";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //    statusBarColor: Colors.transparent
      //color set to transperent or set your own color
    // ));


    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView( 
          
            child:Container( 
                constraints: BoxConstraints(
                    minHeight:MediaQuery.of(context).size.height
                    //set minimum height equal to 100% of VH
                ),
                width:MediaQuery.of(context).size.width,
                //make width of outer wrapper to 100%
                decoration:BoxDecoration(
                  //   gradient: LinearGradient(
                  //       begin: Alignment.topRight,
                  //       end: Alignment.bottomLeft,
                  //        colors: [ Colors.white,
                  //                 Colors.white,
                  //        ],
                  // ),
                ), //show linear gradient background of page  

                padding: EdgeInsets.all(20),
                child:Column(children:<Widget>[
                     
                     Container(
                        margin: EdgeInsets.only(top:80),
                        child: Text("SignUp to Chat", style: TextStyle( 
                            color:Colors.black,fontSize: 40, fontWeight: FontWeight.bold
                        ),), //title text
                     ),

                     Container(
                        margin: EdgeInsets.only(top:10),
                        child: Text("Sign Up to Continue", style: TextStyle( 
                            color:Colors.black,fontSize: 15
                        ),), //subtitle text
                     ),

                     Container( 
                         //show error message here
                         margin: EdgeInsets.only(top:30),
                         padding: EdgeInsets.all(10),
                         child:error? errmsg(errormsg):Container(),
                         //if error == true then show error message
                         //else set empty container as child
                     ),

                     Container( 
                         padding: EdgeInsets.fromLTRB(10,0,10,0),
                        margin: EdgeInsets.only(top:10),
                        child: TextField(
                          controller: _username, //set username controller
                          style:TextStyle(color:Colors.black, fontSize:20),
                          decoration: myInputDecoration(
                              label: "Username",
                              icon: Icons.person,
                          ),
                           onChanged: (value){
                            //set username  text on change
                             username = value;
                          },
                            
                        ),
                     ),
                     Container( 
                         padding: EdgeInsets.fromLTRB(10,0,10,0),
                        margin: EdgeInsets.only(top:10),
                        child: TextField(
                          // controller: _email, //set username controller
                          style:TextStyle(color:Colors.black, fontSize:20),
                          decoration: myInputDecoration(
                              label: "Email",
                              icon: Icons.person,
                          ),
                           onChanged: (value){
                            //set username  text on change
                             username = value;
                          },
                            
                        ),
                     ),


                     Container( 
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _password, //set password controller
                          style: TextStyle(color:Colors.black, fontSize:20),
                          obscureText: true,
                          decoration: myInputDecoration(
                              label: "Password",
                              icon: Icons.lock,
                          ),
                          onChanged: (value){
                             // change password text
                             password = value;
                          },
                            
                        ),
                     ),
          //             Container( 
          //               padding: EdgeInsets.all(10),
          //               child: SelectFormField(
          //   type: SelectFormFieldType.dropdown, // or can be dialog
          //   initialValue: 'circle',
          //   icon: Icon(Icons.list_alt),
          //   labelText: 'Gender',
          //   items: _items,
          //   onChanged: (val) => print(val),
          //   onSaved: (val) => print(val),
          // ),
          //                 // controller: _password, //set password controller
          //                 // style: TextStyle(color:Colors.black, fontSize:20),
          //                 // obscureText: true,
          //                 // decoration: myInputDecoration(
          //                 //     label: "Password",
          //                 //     icon: Icons.lock,
          //                 // ),
          //                 // onChanged: (value){
          //                 //    // change password text
          //                 //    password = value;
          //                 // },
                            
          //               ),
          //            ),
                
                  
                       Container( 
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          // controller: _password, //set password controller
                          style: TextStyle(color:Colors.black, fontSize:20),
                          obscureText: true,
                          decoration: myInputDecoration(
                              label: "Phone",
                              icon: Icons.phone,
                          ),
                          onChanged: (value){
                             // change password text
                             password = value;
                          },
                            
                        ),
                     ),
                    

                     Container( 
                       padding: EdgeInsets.all(10),
                       margin: EdgeInsets.only(top:20),
                       child: SizedBox( 
                         height: 60, width: double.infinity,
                         child:RaisedButton(
                                  onPressed: (){
                                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
                                     setState(() {
                                        //show progress indicator on click
                                        showprogress = true;
                                     });
                                     startLogin();
                                     
                                  },
                                  child: showprogress? 
                                       SizedBox( 
                                         height:30, width:30,
                                         child: CircularProgressIndicator(
                                           backgroundColor: Colors.black,
                                           valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                         ),
                                       ):Text("LOGIN NOW", style: TextStyle(fontSize: 20),),
                                       // if showprogress == true then show progress indicator 
                                       // else show "LOGIN NOW" text
                                  colorBrightness: Brightness.dark,
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:BorderRadius.circular(30)
                                      //button corner radius
                                  ),
                         ),
                      ),
                    ),

                     Container( 
                       padding: EdgeInsets.all(10),
                       margin: EdgeInsets.only(top:20),
                       child: InkResponse(
                           onTap:(){
                            
                             

                              //action on tap
                           },
                           child:Text("Forgot Password? Troubleshoot",
                                 style: TextStyle(color:Colors.black, fontSize:18),
                            )
                       ),
                     )
                ]),
            )
        ),
        
    );
  }

  InputDecoration myInputDecoration({required String label, required IconData icon}){
     return InputDecoration( 
         hintText: label, //show label as placeholder
         hintStyle: TextStyle(color:Colors.black, fontSize:20), //hint text style
         prefixIcon: Padding(
                         padding: EdgeInsets.only(left:20, right:10),
                         child:Icon(icon, color: Colors.black,)
                         //padding and icon for prefix
                      ),
         
         contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
         enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color:Colors.blue, width: 1)
         ), //default border of input

         focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color:Colors.blueGrey, width: 1)
         ), //focus border 

        //  fillColor: const Color.fromRGBO(251,140,0, 0.5),
        //  filled: true, //set true if you want to show input background
     );
  }

  Widget errmsg(String text){
  //error message widget.
        return Container(
            padding: EdgeInsets.all(15.00),
            margin: EdgeInsets.only(bottom: 10.00),
            decoration: BoxDecoration( 
               borderRadius: BorderRadius.circular(30),
               color: Colors.red,
               border: Border.all(color:Colors.blue, width:2)
            ),
            child: Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right:6.00),
                    child: Icon(Icons.info, color: Colors.white),
                ),
                 // icon for error message
                
                Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
                //show error message text
            ]),
        );
  }
}


