//  import 'package:flutter/material.dart';

//  class posts extends StatelessWidget {
  
  
//  @override
//    Widget build(BuildContext context) {
//     return Container(
//       height: 480,
//      margin: EdgeInsets.only(top: 10),
//      width: MediaQuery.of(context).size.width,
//       color: Colors.white,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children:[
//               Container(
//                 margin: EdgeInsets.only(left: 10, top: 10),
//                 child: CircleAvatar(),
//               ),
//                Container(
//                 margin: EdgeInsets.only(left: 10, top: 10),
//                 child: Text("Mentor Hubert",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),
//               ),
//                ),
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 10),
//                 child:Icon(Icons.more_horiz), 
//               ),
//             ],
            
              
//           ),
//           ConstrainedBox(
//             constraints: new BoxConstraints(
//               minHeight: 150,
//               minWidth: 150,
//               maxHeight: 350,
//               maxWidth: MediaQuery.of(context).size.width,
//             ),
//             child: Container(
//               margin: EdgeInsets.only(top: 10),
//               child: Image.network("https://images.unsplash.com/photo-1509512693283-8178ed23e04c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTV8MTEyMDQ4N3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60"),
//               ),
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,

//               children: [
//                 Container(
//                 margin:EdgeInsets.only(top: 10),
//                 alignment: Alignment.center,
//                 height: 50,
//                 width: MediaQuery.of(context).size.width * 0.33,
//                 child: Container(
//                   width: 100,
//                   child: Row(
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         width: 30,
//                         child: Icon(Icons.favorite_border, color:Colors.red,),

//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         width: 30,
//                         child: Text("Like"),
//                       )
//                     ],
//                   ),
//                 )
//                 ),
//                        Container(
//                 margin:EdgeInsets.only(top: 10),
//                 alignment: Alignment.center,
//                 height: 50,
//                 width: MediaQuery.of(context).size.width * 0.33,
//                 child: Container(
//                   width: 100,
//                   child: Row(
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         width: 30,
//                         child: Icon(Icons.add_comment, color:Colors.red,),

//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         width: 30,
//                         child: Text("Comment"),
//                       )
//                     ],
//                   ),
//                 )
//                 ),
//                        Container(
//                 margin:EdgeInsets.only(top: 10),
//                 alignment: Alignment.center,
//                 height: 50,
//                 width: MediaQuery.of(context).size.width * 0.33,
//                 child: Container(
//                   width: 100,
//                   child: Row(
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         width: 30,
//                         child: Icon(Icons.share,color:Colors.red,),

//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         width: 30,
//                         child: Text("Share"),
//                       )
//                     ],
//                   ),
//                 )
//                 ),
//               ],
          
//         )
//         ],
        
//             ),
//           );
        
      
      
    
//   }
// }
import 'package:flutter/material.dart';
import 'package:ui/models/post_list.dart';
import 'package:ui/screens/profile_page.dart';
import 'package:ui/screens/upload_post_page.dart';
class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("Forum",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,),
        ),
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
     
      
      // shrinkWrap: true,
      itemCount: postList.length,
        scrollDirection: Axis.vertical,
        
        
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
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
                                 color:Colors.white,
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              postList[index].time,
                              style: TextStyle(color: Colors.white54),
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
                style: TextStyle(color: Colors.white70, fontSize: 16),
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
                                : Colors.white70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            postList[index].like.toString(),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white70,
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
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            postList[index].comment.toString(),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white70,
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