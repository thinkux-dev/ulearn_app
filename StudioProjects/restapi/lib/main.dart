 import 'package:flutter/material.dart';
import 'package:restapi/example_fiver.dart';
import 'package:restapi/example_four.dart';
import 'package:restapi/example_two.dart';
import 'package:restapi/home_screen.dart';
import 'package:restapi/signup.dart';
import 'package:restapi/upload_image.dart';

import 'example_three.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UploadImageScreen(),
    );
  }
}
