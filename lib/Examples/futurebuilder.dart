import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExFutureBuilder extends StatefulWidget {
  const ExFutureBuilder({super.key});

  @override
  State<ExFutureBuilder> createState() => _ExHttpbackageApiState();
}

class _ExHttpbackageApiState extends State<ExFutureBuilder> {
  bool isloading = true;

  List data = [];

//Get Data
  Future<List> getData() async {
    var response = await get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts")); //Placeholder
    List responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("FutureBuilder"),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      "title: ${snapshot.data![index]['title']}",
                    ),
                    subtitle: Text(
                      "body :: ${snapshot.data![index]['body']}",
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
