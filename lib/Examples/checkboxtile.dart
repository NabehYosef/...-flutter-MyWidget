import 'package:flutter/material.dart';

class CheckBoxTile extends StatefulWidget {
  const CheckBoxTile({super.key});

  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  bool? basketball = false;
  bool? football = false;
  bool? computer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('CheckBox'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Choose Your hobbies',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            CheckboxListTile(
              title: Text('BasketBall'),
              value: basketball,
              onChanged: (value) {
                setState(() {
                  basketball = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('FootBall'),
              value: football,
              onChanged: (value) {
                setState(() {
                  football = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Computer'),
              value: computer,
              onChanged: (value) {
                setState(() {
                  computer = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
