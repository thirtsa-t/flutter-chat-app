import 'package:flutter/material.dart';
import 'package:ui/screens/status_screen.dart';


class StatusPage extends StatefulWidget {
  // const StatusPage(String s, { Key? key }) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height:48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(Icons.edit,color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.redAccent[700],
            elevation: 5, 
            child: Icon(Icons.camera_alt),
          )
        ]
      )
    );
  }
}
 