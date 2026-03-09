import 'package:flutter/material.dart';

class ExStack extends StatelessWidget {
  const ExStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Stack"),
      ),
      body: Container(
        height: 400,
        width: double.infinity,
        color: Colors.yellow,
        child: Stack(
          //   alignment: Alignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
            Text("Nabeh"),
            Positioned(
              child: Text("NabehLeft"),
              left: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}
