import 'package:flutter/material.dart';
import 'package:ui/Customui/contactcard.dart';
import 'package:ui/models/chatmodelpage.dart';
import 'package:ui/customUI/ButtonCard.dart';
import 'package:ui/screens/CreateGroup.dart';
class SelectContacts extends StatefulWidget {
  const SelectContacts({ Key? key }) : super(key: key);

  @override
  _SelectContactsState createState() => _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  @override
  Widget build(BuildContext context) {

 List<ChatModel> contacts = [
      ChatModel(
        name: "thirtsa Stack", 
        status: "A full stack developer"
        ),
      ChatModel(name: "gentille", status: "Flutter Developer..........."),
      ChatModel(name: "olivia", status: "Web developer..."),
      ChatModel(name: "sam", status: "App developer...."),
      ChatModel(name: "Collins", status: "Raect developer.."),
      ChatModel(name: "john", status: "Full Stack Web"),
      ChatModel(name: "Ruta1", status: "Example work"),
      ChatModel(name: "Gikundiro", status: "Sharing is caring"),
      ChatModel(name: "muhamudu", status: "....."),
      ChatModel(name: "Helper", status: "Love you Mom Dad"),
      ChatModel(name: "Tester", status: "I find the bugs"),
       ChatModel(name: "Tester", status: "I find the bugs"),
       
    ];


    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                ),
              ), Text(
                "256 Contacts",
                style: TextStyle(fontSize: 13,
                ),
                )
          ],
        ),
        actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
          ],
        ),
              body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
    
  }
}