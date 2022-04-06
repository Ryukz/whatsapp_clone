// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, curly_braces_in_flow_control_structures, must_be_immutable, prefer_final_fields, unrelated_type_equality_checks, avoid_print, await_only_futures

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_clone/main.dart';
import 'package:flutter_clone/models/chatModels.dart';
import 'package:flutter_clone/pages/callPage.dart';
import 'package:flutter_clone/pages/cameraPage.dart';
import 'package:flutter_clone/pages/chatPage.dart';
import 'package:flutter_clone/pages/statusPage.dart';

List<PopupMenuEntry> itmes = [
  PopupMenuItem(child: Text('New Group')),
  PopupMenuItem(child: Text('New Group')),
  PopupMenuItem(child: Text('New broadcast')),
  PopupMenuItem(child: Text('Linked devices')),
  PopupMenuItem(child: Text('Starred messages')),
  PopupMenuItem(child: Text('Payments')),
  PopupMenuItem(child: Text('Settings')),
];

var searchBarText = "";

class WhatsApp extends StatefulWidget {
  dynamic phoneCameras;
  WhatsApp({this.phoneCameras});

  void searchedData(value) {}

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  Icon customIcon = const Icon(Icons.cancel_sharp);
  Widget customText = Text("WhatsApp");
  bool isSearchingButtonEnabled = false;
  List<ChatModels> filteredData = List.from(dummydata);
  var _controller = TextEditingController();

  void filterData(value) {
    // filteredData = filteredData[];

    setState(() {
      filteredData.clear();
      for (int i = 0; i < dummydata.length; i++) {
        if (dummydata[i]
            .name
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase())) {
          filteredData.add(dummydata[i]);
          print(filteredData[0].name);
        }
      }
      if (filteredData.isEmpty) {
        filteredData = List.from(filteredData);
      }
    });

    //print(filteredData.length);
  }

  @override
  Widget build(BuildContext context) {
    if (!isSearchingButtonEnabled) {
      return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchingButtonEnabled = true;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
                PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => itmes),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 1.0))
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'STATUS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'CALLS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  )
                ],
              ),
              title: customText,
              backgroundColor: Color.fromRGBO(7, 94, 84, 1),
            ),
            body: TabBarView(
              children: [
                CameraPage(
                  allPhoneCameras: cameras,
                ),
                ChatPage(dummydata),
                StatusPage(),
                CallPage(),
              ],
            ),
          );
        }),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color.fromRGBO(7, 94, 84, 1),
          leading: IconButton(
              onPressed: () {
                setState(() {
                  isSearchingButtonEnabled = false;
                  filteredData = List.from(dummydata);
                  _controller.clear();
                });
              },
              icon: Icon(Icons.arrow_back)),
          title: TextField(
            controller: _controller,
            style: TextStyle(color: Colors.white),
            onChanged: (searchedPersonName) {
              setState(() {
                filterData(searchedPersonName);
              });
            },
            autofocus: true,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                isCollapsed: false,
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      filteredData = List.from(dummydata);
                      _controller.clear();
                    });
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                )),
          ),
        ),
        body: ChatPage(filteredData),
      );
    }
  }
}
