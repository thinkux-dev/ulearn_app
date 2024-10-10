import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> uploadImage() async {
    if (image == null) return;

    setState(() {
      showSpinner = true;
    });

    try {
      var stream = http.ByteStream(image!.openRead());
      stream.cast();

      var length = await image!.length();
      var uri = Uri.parse('https://fakestoreapi.com/products');
      var request = http.MultipartRequest('POST', uri);

      request.fields['title'] = 'Static title';
      var multiport = http.MultipartFile(
        'image',
        stream,
        length,
      );

      request.files.add(multiport);

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded');
      } else {
        print('Failed to upload');
      }
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                  child: image == null
                      ? const Center(child: Text('Pick Image'))
                      : Container(
                          child: Center(
                            child: Image.file(
                              File(image!.path).absolute,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
              ),
            ),
            const SizedBox(height: 150),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: const Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
