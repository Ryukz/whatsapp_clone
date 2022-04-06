// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

dynamic image, personName, time;

class StatusViewer extends StatefulWidget {
  dynamic imagePath, name, statusTime;

  StatusViewer(this.imagePath, this.name, this.statusTime) {
    image = imagePath;
    personName = name;
    time = statusTime;
  }

  @override
  State<StatusViewer> createState() => _StatusViewerState();
}

class _StatusViewerState extends State<StatusViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 25,
        bottomOpacity: 0,
        titleSpacing: 15,
        backgroundColor: Colors.black,
        title: ListTile(
          title: Text(
            "$personName",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            '$time',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: image == null
          ? Text("No image captured")
          : Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 500,
              ),
            ),
    );
  }
}
