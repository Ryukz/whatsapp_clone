// ignore_for_file: prefer_const_constructors, await_only_futures, avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone/whatsapp.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  print(cameras);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsApp(
        phoneCameras: cameras,
      ),
    );
  }
}
