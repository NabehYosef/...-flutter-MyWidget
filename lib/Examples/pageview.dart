import 'package:flutter/material.dart';

class ExPageview extends StatelessWidget {
  const ExPageview({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List ImageName = [
      "images/prog.png",
      "images/prog.png",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("PageView & PageViewBuilder"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 300,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (val) {
                  print(val);
                },
                children: [
                  Image.asset("images/prog.png", fit: BoxFit.contain),
                  Image.asset("images/prog.png", fit: BoxFit.contain),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: PageView.builder(
                        itemCount: ImageName.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            ImageName[index],
                            fit: BoxFit.contain,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
