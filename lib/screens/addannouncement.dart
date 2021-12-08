import 'package:flutter/material.dart';



class UploadAnnouncementPage extends StatefulWidget {
  const UploadAnnouncementPage({ Key? key }) : super(key: key);

  @override
  _UploadAnnouncementPageState createState() => _UploadAnnouncementPageState();
}

class _UploadAnnouncementPageState extends State<UploadAnnouncementPage> {
  
  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
    backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text("Add Announcement",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      
      body: Center(
          child: SingleChildScrollView(
            child: Form(
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
                    child: TextField(
                      decoration: InputDecoration(
                         filled: true,

                         fillColor: Colors.white,
                        labelText: 'Description',
                        hintText: 'Enter secure your Description',
                        
                        border: OutlineInputBorder(),
                       
                      ),
                        minLines: 7,
                       maxLines: 7,
                    ),
                  ),
                ],
              ),
            ),
          ),
      )
      
    );
  }
}
