import 'package:flutter/material.dart';



class PostWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   
          
        Container(
          margin: EdgeInsets.only(top:5, bottom:10),
              color:Colors.white,
              height: 180,
              child: Column(
                children: [
                  FlutterLogo(size: 50,),
                  SizedBox(height: 20,),                
                  Text("KlAB App",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  ),
                  Text("thirtsaisimbi@gmail.com",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                  ),
                ],
              ),
            );
       
        
        
           
          
  }
}
  
    
     