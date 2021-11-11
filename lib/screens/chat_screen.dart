import 'package:flutter/material.dart';
import 'package:ui/models/message_model.dart';
import 'package:ui/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  get style => null;

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
        
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Text(
            message.time,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          onPressed: () {},
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'TYPE a message...',
                // prefixIcon:IconButton(icon: Icon(Icons.emoji_emotions,)onPressed: () {},
                // )
                // contentPadding: EdgeInsets.all(S)
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Color(0x73000000),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:InkWell(
          onTap: () {},
        child: Container(
          // ignore: prefer_const_constructors
          margin:  EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment :  MainAxisAlignment.start,
            crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
           Text(
             widget.user.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          ),
        
         Text(
             "Last seen today 12:30pm",
        style: TextStyle(
              fontSize: 13,
            ),
            )
      
          ],
        ),
      ),
        ),
      
        
       actions: <Widget>[
          
           IconButton(
            icon: Icon(Icons.videocam),
            iconSize: 30.0,
             color: Colors.black,
             onPressed: () {}),
              IconButton(
            icon: Icon(Icons.call),
            iconSize: 30.0,
             color: Colors.black,
             onPressed: () {},
           ),
           PopupMenuButton<String>(onSelected: (value) {
            
              // ignore: avoid_print
              print(value);
            }, 
            icon: Icon(Icons.more_vert, color: Colors.black,),
            itemBuilder: (BuildContext context) {
             return [
                const PopupMenuItem(
                  child: Text("View contact"),
                  value: "View contact",
                ),
                const PopupMenuItem(
                  child: Text("Media,links,dots"),
                  value: "Media,links,dots",
                ),
                const PopupMenuItem(
                  child: Text("KLab web"),
                  value: "Klab Web",
                ),
                const PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                const PopupMenuItem(
                  child: Text("Mute,Notification"),
                  value: "Mute,Notification",
                ),
                const PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "wallpaper",
                  ),
              ];
            })
         ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
      ); 
    

  }
}

class S {
}


