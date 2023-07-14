import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:googlesignin/signin.dart';


List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera Swipe Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Sign(),
    );
  }
}
