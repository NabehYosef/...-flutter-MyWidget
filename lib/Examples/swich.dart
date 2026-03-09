import 'package:flutter/material.dart';

class exSwich extends StatefulWidget {
  @override
  State<exSwich> createState() => _exSwichState();
}

class _exSwichState extends State<exSwich> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Swich"),
      ),
      body: Column(
        children: [
          Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.orange,
              value: status,
              onChanged: (value) {
                setState(() {
                  status = value;
                });
              }),
          SwitchListTile(
              title: Text("Status"),
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.orange,
              value: status,
              onChanged: (value) {
                setState(() {
                  status = value;
                });
              }),
          Text(
            "SwichListTile She get all Width ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: status,
            onChanged: (value) {
              setState(() {
                status = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
