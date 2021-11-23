import 'package:flutter/material.dart';



class UploadPostPage extends StatefulWidget {
  const UploadPostPage({ Key? key }) : super(key: key);

  @override
  _UploadPostPageState createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  var selectedCategoryId;
  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      backgroundColor:Colors.grey,
      appBar: AppBar(
        title: Text("New post",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      
      body:ListView(
        padding: EdgeInsets.all(16),
       
          
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,

                  fillColor: Colors.white,
              hintText: "Enter title",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left:10)
            ),
          ),
          SizedBox(height: 20,),
          // ignore: prefer_const_constructors
          TextField(
           
            decoration: InputDecoration(
              filled: true,

                  fillColor: Colors.white,
              hintText: "Enter Description",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left:10,top: 10,bottom: 10)
               
            ),
            minLines: 4,
            maxLines: 4,
          ),
          SizedBox(height: 20,),
          DropdownButtonFormField<int>(
            onChanged: (i){

            }, 
            items: [
              DropdownMenuItem(child: Text("Laravel"),value: 1,)
            ],
            decoration: InputDecoration(
              filled: true,

                  fillColor: Colors.white,
              hintText: "Select Category"
            ),
          ),
          SizedBox(height: 20,),
                    Row(
                    
                      mainAxisAlignment: MainAxisAlignment.center,
                     
                      children: [
                       
                        Text("Up load",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            //  onPressed: () {},
                            
                        ),
                        ),
                        

        ],
      
        
      ),
        ]
      ),
      
    );
  }
}
