import 'package:flutter/material.dart';

class ExListGenerate extends StatelessWidget {
  const ExListGenerate({super.key});

  @override
  Widget build(BuildContext context) {
    List username = [
      {
        "name": "Nabeh",
        "age": 20,
      },
      {
        "name": "Ali",
        "age": 21,
      },
      {
        "name": "Ahmad",
        "age": 29,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListGenerate",
        ),
      ),
      body: ListView(
        children: [
          ...List.generate(username.length, (index) {
            return Card(
              child: ListTile(
                title: Text(username[index]['name']),
              ),
            );
          }),
        ],
      ),
    );
  }
}
