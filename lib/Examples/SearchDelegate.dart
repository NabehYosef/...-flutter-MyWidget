import 'package:flutter/material.dart';

class ExSearchDelegate extends StatelessWidget {
  const ExSearchDelegate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "SearchDelegate",
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List usernaem = [
    "Ali",
    "Nabeh",
    "Yaser",
    "Adnan",
    "Ahmad",
    "Hasan",
    "Noor",
    "Laith",
  ];
  List? filterList;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Result ${query}");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
          itemCount: usernaem.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  "${usernaem[index]}",
                  style: TextStyle(fontSize: 16),
                ),
              )),
            );
          });
    } else {
      filterList =
          usernaem.where((element) => element.startsWith(query)).toList();
      return ListView.builder(
          itemCount: filterList!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  "${filterList![index]}",
                  style: TextStyle(fontSize: 16),
                ),
              )),
            );
          });
    }
  }
}
