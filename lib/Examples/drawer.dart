import 'package:flutter/material.dart';

class ExDrawer extends StatelessWidget {
  const ExDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> stateDrawer = GlobalKey();
    return Scaffold(
      key: stateDrawer,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Drawer"),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Container(
              child: Image.asset("images/prog.png"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange,
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.asset(
                      "images/prog.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text("Nabeh"),
                    subtitle: Text("Nabeh@gmail.com"),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text("HomePage"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.account_balance_rounded),
              onTap: () {},
            ),
            ListTile(
              title: Text("Order"),
              leading: Icon(Icons.check_box),
              onTap: () {},
            ),
            ListTile(
              title: Text("About Us"),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.phone_android_outlined),
              onTap: () {},
            ),
            ListTile(
              title: Text("Sign Out"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("OpenDrawer"),
                onPressed: () {
                  stateDrawer.currentState!.openDrawer();
                },
              ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.black, thickness: 10),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: MaterialButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Text("OpenEndDrawer"),
                onPressed: () {
                  stateDrawer.currentState!.openEndDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
