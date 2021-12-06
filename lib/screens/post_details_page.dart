
import 'package:flutter/material.dart';
import 'package:ui/models/post_list.dart';
import 'package:ui/screens/profile_page.dart';
import 'package:ui/screens/upload_post_page.dart';
class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar:AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("Forum",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,),
        ),
        centerTitle: true,
         actions: [
            // action button
            IconButton(
              icon: Icon( Icons.add ),
              color: Colors.white,
              onPressed: () { 
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadPostPage()),
             );
              },
            ),
          
          ],
          leading: IconButton(
            icon: Icon( Icons.person ),
            color: Colors.white,
            onPressed: () { 
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
             );
            },
          ),
          ),

    body:ListView.builder(
     
      
       shrinkWrap: true,
      itemCount: postList.length,
        scrollDirection: Axis.vertical,
        
        
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
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
                              postList[index].name,
                             
                              style: TextStyle(
                                 color:Colors.black,
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              postList[index].time,
                              style: TextStyle(color: Colors.black),
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
                postList[index].title,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(postList[index].image),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 24,
                            color: postList[index].likeStatus
                                ? Colors.red
                                : Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            postList[index].like.toString(),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.messenger_outline,
                            size: 24,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            postList[index].comment.toString(),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Transform.rotate(
                    angle: -0.6,
                    child: Icon(
                      Icons.send,
                      size: 23,
                      color: Colors.white70,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    ),
    );
  }
}