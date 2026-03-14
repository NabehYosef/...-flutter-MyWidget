import 'package:flutter/material.dart';

class ExPopupMenuButton extends StatelessWidget {
  const ExPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "PopupMenuButton",
        ),
        actions: [
          PopupMenuButton(onCanceled: () {
            print(
              "Canceld",
            );
          }, onOpened: () {
            print(
              "Opened",
            );
          }, onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text("one"),
                value: "valueOne",
              ),
              PopupMenuItem(
                child: Text("two"),
                value: "valueTwo",
              ),
            ];
          }),
        ],
      ),
    );
  }
}
