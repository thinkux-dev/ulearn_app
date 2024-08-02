import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restapi/dropdown_model.dart';
import 'package:http/http.dart' as http;

class DropDownApi extends StatefulWidget {
  const DropDownApi({super.key});

  @override
  State<DropDownApi> createState() => _DropDownApiState();
}

class _DropDownApiState extends State<DropDownApi> {
  Future<List<DropdownModel>> getPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = json.decode(response.body) as List;

      if (response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return DropdownModel(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('No internet');
    }
    throw Exception('Error fetching data');
  }

  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Api'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<DropdownModel>>(
              future: getPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton(
                    hint: Text('Select value'),
                    isExpanded: true,
                    value: selectedValue,
                    icon: Icon(Icons.add_circle_outline),
                    items: snapshot.data!.map((e){
                      return DropdownMenuItem(
                        value: e.title.toString(),
                        child: Text(e.title.toString()),
                      );
                    }).toList(),
                    onChanged: (value){
                      selectedValue = value;
                      setState(() {

                      });
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
