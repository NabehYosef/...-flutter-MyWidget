import 'package:flutter/material.dart';

class ExTapBar extends StatelessWidget {
  const ExTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.red,
              indicatorWeight: 10,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: 10),
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(
                  icon: Icon(Icons.laptop),
                  text: "Laptop",
                ),
                Tab(
                  icon: Icon(Icons.mobile_friendly),
                  text: "Mobile",
                ),
                Tab(
                  icon: Icon(Icons.computer),
                  text: "PC",
                ),
              ],
            ),
            backgroundColor: Colors.orange,
            title: Text("TapBar"),
          ),
          body: Container(
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Text("Laptop page"),
                  ],
                ),
                Text("Mobile page"),
                Text("PC page"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
