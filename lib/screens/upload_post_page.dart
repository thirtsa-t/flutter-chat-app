import 'package:flutter/material.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({Key? key}) : super(key: key);

  @override
  _UploadPostPageState createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  var selectedCategoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          title: Text(
            "New post",
            
            style: TextStyle(
              color: Colors.black,
            ),
            
          ),
           centerTitle: true,
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
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(
                  //   radius: 70,
                  //   child: Image.asset("assets/images/klab.png"),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                         filled: true,

                         fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'title',
                          hintText: 'Enter  your title'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                         filled: true,

                         fillColor: Colors.white,
                        labelText: 'Description',
                        hintText: 'Enter  your Description',
                        
                        border: OutlineInputBorder(),
                       
                      ),
                        minLines: 7,
                       maxLines: 7,
                    ),
                  ),
                   SizedBox(
                  width: 400,
                  height: 50,
                  
                  child: RaisedButton(
                     
                    color: const Color(0xFF2B5894),
                    onPressed: () {
            //              Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SigninScreen()),
            // );
                      // if (_formkey.currentState!.validate()) {
                      //   RegistrationUser();
                      //   print("Successful");
                      // } else {
                      //   print("Unsuccessfull");
                      // }
                    },
                    shape: RoundedRectangleBorder(
                         
                        borderRadius: BorderRadius.circular(50.0),
                      
                        side: BorderSide(color: Colors.white )),
                        
                       
                    textColor: Colors.black,
                    child: Text("Upload"),
                  ),
                ),
                ],
              ),
            ),
          ),
        ));
  }
  Widget imagepProfile(){
    return Stack(
children: <Widget>[
  CircleAvatar(
    radius: 80.0,
    backgroundImage: AssetImage("assets/images/sam.jpg"),
  ),    


],
    );
  }
  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            )
            )
      ),
    );
  }
}
