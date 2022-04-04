// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, curly_braces_in_flow_control_structures, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_clone/main.dart';
import 'package:flutter_clone/pages/callPage.dart';
import 'package:flutter_clone/pages/cameraPage.dart';
import 'package:flutter_clone/pages/chatPage.dart';

List<PopupMenuEntry> itmes = [
  PopupMenuItem(child: Text('New Group')),
  PopupMenuItem(child: Text('New Group')),
  PopupMenuItem(child: Text('New broadcast')),
  PopupMenuItem(child: Text('Linked devices')),
  PopupMenuItem(child: Text('Starred messages')),
  PopupMenuItem(child: Text('Payments')),
  PopupMenuItem(child: Text('Settings')),
];

class WhatsApp extends StatefulWidget {
  dynamic phoneCameras;
  WhatsApp({this.phoneCameras});

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Icon(Icons.search),
              PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => itmes),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 1.0))
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              tabs: [
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text(
                    'CHATS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'STATUS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'CALLS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                )
              ],
            ),
            title: const Text('WhatsApp'),
            backgroundColor: Color.fromRGBO(7, 94, 84, 1),
          ),
          body: TabBarView(
            children: [
              CameraPage(
                allPhoneCameras: cameras,
              ),
              ChatPage(),
              Icon(Icons.directions_bike),
              CallPage(),
            ],
          ),
        );
      }),
    );
  }
}
