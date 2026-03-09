import 'package:flutter/material.dart';
import 'package:fund_app/Examples/checkboxtile.dart';
import 'package:fund_app/Examples/stack.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExStack(),
    );
  }
}
