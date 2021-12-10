

import 'package:flutter/material.dart';
import 'package:ui/07_profile/body.dart';

class profileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
      ),
      body: Body(),
      
    );
  }
}