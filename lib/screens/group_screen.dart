// import 'package:ui/CustomUI/button_card.dart';
// import 'package:ui/CustomUI/contact_card.dart';
// import 'package:ui/CustomUI/avart_card.dart';
// import 'package:ui/models/group_model.dart';
// import 'package:flutter/material.dart';


// class CreateGroup extends StatefulWidget {
//   CreateGroup({Key ? key}) : super(key: key);

//   @override
//   _CreateGroupState createState() => _CreateGroupState();
// }

// class _CreateGroupState extends State<CreateGroup> {
//   List<GroupModel> contacts = [
//     GroupModel(name: "Dev Stack", status: "A full stack developer"),
//   GroupModel(name: "Balram", status: "Flutter Developer..........."),
//     GroupModel(name: "Saket", status: "Web developer..."),
//     GroupModel(name: "Bhanu Dev", status: "App developer...."),
//     GroupModel(name: "Collins", status: "Raect developer.."),
//     GroupModel(name: "Kishor", status: "Full Stack Web"),
//     GroupModel(name: "Testing1", status: "Example work"),
//    GroupModel(name: "Testing2", status: "Sharing is caring"),
//     GroupModel(name: "Divyanshu", status: "....."),
//     GroupModel(name: "Helper", status: "Love you Mom Dad"),
//     GroupModel(name: "Tester", status: "I find the bugs"),
//   ];
//   List<GroupModel> groupmember = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "New Group",
//                 style: TextStyle(
//                   fontSize: 19,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "Add participants",
//                 style: TextStyle(
//                   fontSize: 13,
//                 ),
//               )
//             ],
//           ),
//           actions: [
//             IconButton(
//                 icon: Icon(
//                   Icons.search,
//                   size: 26,
//                 ),
//                 onPressed: () {}),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//             backgroundColor: Color(0xFF128C7E),
//             onPressed: () {},
//             child: Icon(Icons.arrow_forward)),
//         body: Stack(
//           children: [
//             ListView.builder(
//                 itemCount: contacts.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index == 0) {
//                     return Container(
//                       height: groupmember.length > 0 ? 90 : 10,
//                     );
//                   }
//                   return InkWell(
//                     onTap: () {
//                       setState(() {
//                         if (contacts[index - 1].select == true) {
//                           groupmember.remove(contacts[index - 1]);
//                           contacts[index - 1].select = false;
//                         } else {
//                           groupmember.add(contacts[index - 1]);
//                           contacts[index - 1].select = true;
//                         }
//                       });
//                     },
//                     child: ContactCard(
//                       contact: contacts[index - 1],
//                     ),
//                   );
//                 }),
//             groupmember.length > 0
//                 ? Align(
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 75,
//                           color: Colors.white,
//                           child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: contacts.length,
//                               itemBuilder: (context, index) {
//                                 if (contacts[index].select == true)
//                                   return InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         groupmember.remove(contacts[index]);
//                                         contacts[index].select = false;
//                                       });
//                                     },
//                                     child: AvatarCard(
//                                       groupModel: contacts[index],
//                                     ),
//                                   );
//                                 return Container();
//                               }),
//                         ),
//                         Divider(
//                           thickness: 1,
//                         ),
//                       ],
//                     ),
//                     alignment: Alignment.topCenter,
//                   )
//                 : Container(),
//           ],
//         ));
//   }
// }
