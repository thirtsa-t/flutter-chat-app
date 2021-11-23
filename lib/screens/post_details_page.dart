import 'package:flutter/material.dart';

class posts extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:[
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: CircleAvatar(),
              ),
               Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text("Mentor Hubert",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),
              ),
               ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child:Icon(Icons.more_horiz), 
              ),
            ],
            
              
          ),
          ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 150,
              minWidth: 150,
              maxHeight: 350,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.network("https://images.unsplash.com/photo-1509512693283-8178ed23e04c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTV8MTEyMDQ4N3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60"),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                margin:EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Container(
                  width: 100,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Icon(Icons.favorite_border, color:Colors.red,),

                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Text("Like"),
                      )
                    ],
                  ),
                )
                ),
                       Container(
                margin:EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Container(
                  width: 100,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Icon(Icons.add_comment, color:Colors.red,),

                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Text("Comment"),
                      )
                    ],
                  ),
                )
                ),
                       Container(
                margin:EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Container(
                  width: 100,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Icon(Icons.share,color:Colors.red,),

                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: Text("Share"),
                      )
                    ],
                  ),
                )
                ),
              ],
          
        )
        ],
        
            ),
          );
        
      
      
    
  }
}