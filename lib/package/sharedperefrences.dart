import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExSharedPreferences extends StatelessWidget {
  const ExSharedPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("SharedPereferences"),
      ),
      body: ListView(
        children: [
          MaterialButton(
            child: Text("SetName"),
            onPressed: () async {
              SharedPreferences sharedpreferences =
                  await SharedPreferences.getInstance();
              sharedpreferences.setString("name", "Nabeh");
            },
          ),
          MaterialButton(
            child: Text(
              "PrintName",
              style: TextStyle(
                fontFamily: "IosevkaCharonMono-Regular",
              ),
            ),
            onPressed: () async {
              SharedPreferences sharedpreferences =
                  await SharedPreferences.getInstance();
              String name = sharedpreferences.getString("name")!;
              print("$name");
            },
          ),
        ],
      ),
    );
  }
}
