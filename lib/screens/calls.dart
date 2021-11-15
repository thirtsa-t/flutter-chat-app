import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Column(
     
      children: [
      
     Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: 
          ListTile(
            contentPadding: EdgeInsets.only(left:5,right: 17),
           leading: Container(
             width: 70,
             height: 100,

             child: const CircleAvatar(backgroundImage: AssetImage("assets/images/gentille.jpg"),)),
          title: Text("gentille"),
          subtitle: Row(
            children: const [
              Icon(Icons.call_received
              ,size: 20,
              color: Colors.green,
              ),
              Text('Yesterday,11:14'),
            ],
          ),
          trailing: Icon(
            
            Icons.call ,
          size: 25,
          color: Theme.of(context).primaryColor,),
          

          ),
        ),
        const Divider()
  
      ],
    );
  }
}