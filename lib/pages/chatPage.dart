// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_clone/models/chatModels.dart';

late List<ChatModels> updatedData;

class ChatPage extends StatefulWidget {
  late List<ChatModels> dataToShow;

  ChatPage(this.dataToShow) {
    updatedData = dataToShow;
  }

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    //print(updatedData.length);
    if (updatedData.isNotEmpty) {
      return ListView.builder(
          itemCount: updatedData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Divider(
                  height: 2.0,
                  thickness: 1.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(updatedData[index].imageUrl),
                    radius: 20,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        updatedData[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  subtitle: Text(updatedData[index].message),
                  trailing: Text(updatedData[index].time),
                ),
              ],
            );
          });
    } else {
      return Center(
        child: Text('No Result Found'),
      );
    }
  }
}
