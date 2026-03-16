import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ExAwesomedialogbackage extends StatefulWidget {
  const ExAwesomedialogbackage({super.key});

  @override
  State<ExAwesomedialogbackage> createState() => _ExAwesomedialogbackageState();
}

class _ExAwesomedialogbackageState extends State<ExAwesomedialogbackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Awesomedialogbackage"),
      ),
      body: ListView(
        children: [
          MaterialButton(
            child: const Text("Show Dialog"),
            onPressed: () {
              print("******************Nabeh");

              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                headerAnimationLoop: false,
                animType: AnimType.bottomSlide,
                title: 'Question',
                desc: 'Dialog description here...',
                buttonsTextStyle: const TextStyle(color: Colors.black),
                showCloseIcon: true,
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              ).show();
            },
          ),
        ],
      ),
    );
  }
}
