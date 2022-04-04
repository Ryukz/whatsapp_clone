// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clone/models/callModels.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
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
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.call_made_sharp,
                        size: 15,
                        color: Colors.green[900],
                      ),
                      Text(dummydata[index].callTime)
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call_sharp,
                        color: Colors.green[900],
                      ))),
            ],
          );
        });
  }
}
