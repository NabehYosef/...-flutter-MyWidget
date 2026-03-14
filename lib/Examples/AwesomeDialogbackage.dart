import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ExAwesomedialogbackage extends StatelessWidget {
  const ExAwesomedialogbackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        //centerTitle: true,
        title: Text("AppBar"),
      ),
      body: ListView(
        children: [
          MaterialButton(
            child: Text("Show Dialog"),
            onPressed: () {
              AnimatedButton(
                text: 'Warning Dialog With Custom BTN Style',
                pressEvent: () {
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
              );
            },
          ),
        ],
      ),
    );
  }
}
