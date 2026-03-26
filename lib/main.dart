import 'package:flutter/material.dart';
import 'package:fund_app/Examples/appbar.dart';
import 'package:fund_app/Examples/pageview.dart';
import 'package:fund_app/Examples/tapbar.dart';
import 'package:fund_app/Examples/test.dart';
import 'package:fund_app/Examples/textfield.dart';
import 'package:fund_app/package/AwesomeDialogbackage.dart';
import 'package:fund_app/package/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor:
                Colors.green),
        fontFamily:
            "IosevkaCharonMono-Regular",
      ),
      home: LoginScreen(),
      routes: {
        "ExAppBar": (context) =>
            ExAppBar(),
        "ExPageview": (context) =>
            ExPageview(),
        "ExTabBar": (context) =>
            ExTapBar(),
        "ExTextField": (context) =>
            ExTextField(),
        //Nabvigator.of(context).pushNamed("ExPageName"),
      },
    );
  }
}
