// import 'package:flutter/material.dart';


// class StatusPage extends StatefulWidget {
//   const StatusPage({ Key? key }) : super(key: key);

//   @override
//   _StatusPageState createState() => _StatusPageState();
// }

// class _StatusPageState extends State<StatusPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Column(
//         children: [
//           Container(
//             child: FloatingActionButton(
//               backgroundColor: Colors.blueGrey[100],
//               onPressed: () {},
//               child: Icon(Icons.edit,color: Colors.blueGrey[900],)
//             )
//           )
//         ]
//       )
//     );
//   }
// }
 
   
import 'package:flutter/material.dart';
import 'package:ui/models/message_model.dart';
import 'package:ui/screens/chat_screen.dart';
import 'package:ui/screens/status_screen.dart';
import 'package:ui/screens/status_screen.dart';

class StatusPage extends StatelessWidget {
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
     
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        //  floatingActionButton:FloatingActionButton(onPressed: () {},
        // child: Icon(Icons.chat) 
        
        // )
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return GestureDetector(
                
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(

                    builder: (_) => StatusPage(
                      // user: chat.sender,
                    
                    ),
                  ),
                  
                 //  floatingActionButton:FloatingActionButton(onPressed: () {},
        // child: Icon(Icons.chat) 
        
        // ) 
                ),
                
                
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: chat.unread ? Color(0x73000000) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                chat.sender.name,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            chat.time,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          chat.unread
                              ? Container(
                                  width: 40.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'NEW',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Text('New'),
                  
                        ],
                        
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
}
}



