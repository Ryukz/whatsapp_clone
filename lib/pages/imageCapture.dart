// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, must_call_super

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

XFile? capturedImage;

class CapturedImage extends StatefulWidget {
  CapturedImage(dynamic image) {
    capturedImage = image;
  }
  @override
  State<CapturedImage> createState() => _CapturedImageState();
}

class _CapturedImageState extends State<CapturedImage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(30),
      child: capturedImage == null
          ? Text("No image captured")
          : Image.file(
              File(capturedImage!.path),
              height: 300,
            ),
    );
  }
}
