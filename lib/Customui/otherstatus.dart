import 'package:flutter/material.dart';

class OtherStatus extends StatefulWidget {
  const OtherStatus({ Key? key, required this.name, required this.time, required this.imageName}) 
  : super(key: key);
  final String name;
  final String time;
  final String imageName;



  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(imageName),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        time,
        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
      ),
      
      
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}