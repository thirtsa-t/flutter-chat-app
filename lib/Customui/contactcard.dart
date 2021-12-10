
import 'package:flutter/material.dart';
import 'package:ui/models/chatmodelpage.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({ Key? key, required this.contact, }) : super(key: key);
final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: Container(
      height: 53,
      width: 50,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 35.0,
            
           backgroundImage:
           AssetImage("assets/images/olivia.jpg",),
           
          ),
          contact.select 
         ? Positioned(
            bottom: 4,
            right: 5,
            child: CircleAvatar(
              backgroundColor: Color(0xff282d36),
              radius: 11,
         child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
            ),
          )
          :Container(),
        ],
      ),
    ),
    title: Text(
      contact.name,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      contact.status,
      style: TextStyle(
        fontSize: 13,
      ),
    ),
    );
  }
}