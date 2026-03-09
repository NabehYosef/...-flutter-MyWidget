import 'package:flutter/material.dart';

class ExSwichRadioList extends StatefulWidget {
  const ExSwichRadioList({super.key});

  @override
  State<ExSwichRadioList> createState() => _ExSwichRadioListState();
}

class _ExSwichRadioListState extends State<ExSwichRadioList> {
  int counter = 0;
  bool eswitch = true;
  String? country;
  int? age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          print(
            'Nabeh',
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Swich RadioList',
        ),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Icon(Icons.add),
            color: Colors.black,
          ),
          Text(
            '$counter',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            icon: Icon(Icons.remove),
            color: Colors.black,
          ),
          SizedBox(
            height: 30,
          ), //======================================
          //==========================================

          SizedBox(
            height: 30,
          ), //======================================
          //==========================================
          Text(
            "Choose Your Country",
            style: TextStyle(fontSize: 20),
          ),
          RadioListTile(
            //Radio without title but (RadioListTile with title an another things)
            tileColor: Colors.green,
            activeColor: Colors.red,
            title: Text('Syria'),
            value: "Syria",
            groupValue: country,
            onChanged: (value) {
              setState(() {
                country = value;
              });
            },
          ),
          RadioListTile(
            tileColor: Colors.blue,
            activeColor: Colors.red,
            title: Text('egybt'),
            value: "egybt",
            groupValue: country,
            onChanged: (value) {
              setState(() {
                country = value;
              });
            },
          ),
          RadioListTile(
            tileColor: Colors.yellow,
            activeColor: Colors.red,
            title: Text('Jordon'),
            value: "Jordon",
            groupValue: country,
            onChanged: (value) {
              setState(() {
                country = value;
              });
            },
          ),
          Text(
            "Choose Your Age",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          RadioListTile(
            title: Text('35'),
            value: 35,
            groupValue: age,
            onChanged: (value) {
              setState(() {
                age = value;
              });
            },
          ),
          RadioListTile(
            title: Text('21'),
            value: 21,
            groupValue: age,
            onChanged: (value) {
              setState(() {
                age = value;
              });
            },
          ),
          RadioListTile(
            title: Text('23'),
            value: 23,
            groupValue: age,
            onChanged: (value) {
              setState(() {
                age = value;
              });
            },
          ),
          Text('Your Country $country'),
          Text('Your age $age'),
        ],
      ),
    );
  }
}
