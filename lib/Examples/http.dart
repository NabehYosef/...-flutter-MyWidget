import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExHttpbackageApi extends StatefulWidget {
  const ExHttpbackageApi({super.key});

  @override
  State<ExHttpbackageApi> createState() => _ExHttpbackageApiState();
}

class _ExHttpbackageApiState extends State<ExHttpbackageApi> {
  bool isloading = false;

  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("HttpRequest"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: MaterialButton(
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("Http Request"),
                onPressed: () async {
                  isloading = true;
                  setState(() {});
                  var response = await get(Uri.parse(
                      "https://jsonplaceholder.typicode.com/posts")); //Placeholder
                  var responsebody = jsonDecode(response.body);
                  data = responsebody;
                  // print(responsebody);
                  isloading = false;
                  setState(() {});
                },
              ),
            ),
          ),
          if (isloading)
            Center(
              child: CircularProgressIndicator(),
            ),
          ...List.generate(data.length, (index) {
            return Card(
              child: ListTile(
                title: Text(
                  "title: ${data[index]['title']}",
                ),
                subtitle: Text(
                  "body :: ${data[index]['body']}",
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
