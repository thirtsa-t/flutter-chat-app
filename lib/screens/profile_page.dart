import 'package:flutter/material.dart';
import 'package:ui/screens/post_widget.dart';


class ProfilePage extends StatefulWidget {
  
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var isUsingDarkTheme;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("profile",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,),),
        actions: [
          
          // Switch(value: Theme.of(context).DarkMode, onChanged: (bool value) {
          // //   if(Theme.of(context).isUsingDark){
          // //     Theme.of(context).themeMode = ThemeMode.light;
          // //   }else{
          // //     Theme.of(context).themeMode = ThemeMode.dark;
          // //   }
          // },
          // ),
        ],
          
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            color:Colors.white,
            height: 150,
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: 50,),
                SizedBox(height: 20,),                Text("KlAB App",style: TextStyle(
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
          ),
          SizedBox(height: 20,),
          Text("Your Post", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
          SizedBox(height: 20,),
        
          
          PostWidget(),
            PostWidget(),
             PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
          

        ],
      )
    );
  }
}