// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_clone/models/statusModels.dart';
import 'package:flutter_clone/pages/statusViewer.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 400,
            padding: EdgeInsets.fromLTRB(25, 8, 8, 8),
            color: Colors.grey[350],
            child: Text(
              'Recent updates',
            
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromRGBO(7, 94, 84, 1),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummydata.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Divider(
                      height: 2.0,
                      thickness: 1.0,
                    ),
                    ListTile(
                      leading: IconButton(
                        constraints: BoxConstraints(),
                        splashRadius: Material.defaultSplashRadius,
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        iconSize: 65,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatusViewer(
                                    dummydata[index].imageUrl,
                                    dummydata[index].name,dummydata[index].time)),
                          );
                        },
                        icon: CircleAvatar(
                          radius: 65,
                          backgroundImage:
                              NetworkImage(dummydata[index].imageUrl),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dummydata[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      subtitle: Text(dummydata[index].time),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
