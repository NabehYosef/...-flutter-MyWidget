import 'package:flutter/material.dart';

class ExScroll extends StatefulWidget {
  const ExScroll({super.key});

  @override
  State<ExScroll> createState() => _ExScrollState();
}

class _ExScrollState extends State<ExScroll> {
  late ScrollController scrollcontroller;

  @override
  void initState() {
    scrollcontroller = ScrollController();
    scrollcontroller.addListener(() {
      print("${scrollcontroller.offset}");
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Scroll"),
      ),
      body: ListView(
        controller: scrollcontroller,
        children: [
          MaterialButton(
              child: Text("Jump to Buttom"),
              onPressed: () {
                scrollcontroller.animateTo(
                  9596.0,
                  duration: Duration(seconds: 2),
                  curve: Curves.ease,
                );
              }),
          ...List.generate(100, (index) {
            return Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(
                "$index",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: index.isEven ? Colors.red : Colors.green,
            );
          }),
          MaterialButton(
              child: Text("Jump to Top"),
              onPressed: () {
                scrollcontroller.animateTo(
                  0,
                  duration: Duration(seconds: 2),
                  curve: Curves.ease,
                );
              }),
        ],
      ),
    );
  }
}
