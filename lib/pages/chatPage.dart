// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clone/models/chatModels.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummydata.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Divider(
                height: 2.0,
                thickness: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(dummydata[index].imageUrl),
                  radius: 20,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dummydata[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                subtitle: Text(dummydata[index].message),
                trailing: Text(dummydata[index].time),
              ),
            ],
          );
        });
  }
}
