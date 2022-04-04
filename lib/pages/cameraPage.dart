// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, must_call_super, curly_braces_in_flow_control_structures, unused_local_variable, prefer_const_constructors

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone/pages/imageCapture.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraPage extends StatefulWidget {
  List<CameraDescription>? allPhoneCameras;

  CameraPage({this.allPhoneCameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? cameraController;
  XFile? image; //for captured image
  @override
  void initState() {
    super.initState();
    cameraController = CameraController(
        widget.allPhoneCameras![0], ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420);
    cameraController!.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController!.value.isInitialized) return Container();

    return AspectRatio(
      aspectRatio: cameraController!.value.aspectRatio,
      // child: CameraPreview(cameraController!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CameraPreview(cameraController!),
          ElevatedButton.icon(
            //image capture button
            onPressed: () async {
              try {
                if (cameraController != null) {
                  //check if contrller is not null
                  if (cameraController!.value.isInitialized) {
                    //check if controller is initialized
                    image =
                        await cameraController!.takePicture(); //capture image
                    setState(() {
                      //update UI
                    });
                  }
                }
              } catch (e) {
                print(e); //show error
              }

              print(image!.path.toString());
              GallerySaver.saveImage(image!.path.toString());

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CapturedImage(image)),
              );
            },
            icon: Icon(Icons.camera),
            label: Text("Capture"),
          ),
          // Container(
          //   //show captured image

          //   child: image == null
          //       ? Text("No image captured")
          //       : Image.file(
          //           File(image!.path),
          //           height: 200,
          //         ),
          //   //display captured image
          // )
        ],
      ),
    );
  }
}
