import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExTextFormField extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();

  ExTextFormField({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("TextFormField"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Form(
                //  autovalidateMode: AutovalidateMode.always,
                key: formstate,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "لا يمكن أن يكون فارغ";
                    }
                    return null;
                  },
                ),
              ),
              MaterialButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  child: Text("Valid"),
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      print("Valid");
                    } else {
                      print("Not Valid");
                    }
                  }),
              SizedBox(height: 5),
              Divider(color: Colors.black, thickness: 10),
              SizedBox(height: 5),
            ],
          )
        ],
      ),
    );
  }
}
