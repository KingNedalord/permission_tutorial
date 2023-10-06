import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "";
  String text1 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            MaterialButton(onPressed: () async {
              PermissionStatus perm = await Permission.camera.request();
              if (perm.isGranted) {
                setState(() {
                  text = "granted";
                });
              } else if (perm.isDenied) {
                setState(() {
                  text = "denied";
                });
              }
            },child: Text("Camera"),),
            Text(text1),
            MaterialButton(onPressed: () async {
              PermissionStatus perm = await Permission.microphone.request();
              if (perm.isGranted) {
                setState(() {
                  text1 = "granted";
                });
              } else if (perm.isDenied) {
                setState(() {
                  text1 = "denied";
                });
              }
            },child: Text("Microphone"),)
          ],
        ),
      ),
    );
  }
}
