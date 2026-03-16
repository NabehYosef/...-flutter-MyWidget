import 'package:flutter/material.dart';
import 'package:fund_app/package/AppTextField.dart';

class Exdropdownlist extends StatefulWidget {
  const Exdropdownlist({super.key});

  @override
  State<Exdropdownlist> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Exdropdownlist> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        title: Text("DropDownList"),
      ),
      body: ListView(
        children: [
          AppTextField(
            textEditingController: cityController,
            title: "City",
            hint: "Select City",
            datalist: [
              "Dubai",
              "Abu Dhabi",
              "Syria",
              "Ajman",
            ],
          )
        ],
      ),
    );
  }
}
