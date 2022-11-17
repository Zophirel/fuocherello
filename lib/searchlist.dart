import 'package:flutter/material.dart';
import 'searchbar.dart' as src_bar;

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => SearchListState();
}

class SearchListState extends State<SearchList> {
  List<String> matchedList = [];

  @override
  void initState() {
    super.initState();
  }

  Map<String, String> originalData = {
    "titolo prodotto": "https://www.google.com",
    "b": "https://www.google.com",
    "c": "https://www.google.com"
  };

  var items = [];

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(originalData.keys);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.toLowerCase().contains(query) || item.contains(query)) {
          dummyListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        if (query != "") {
          items.clear();
          items.addAll(originalData.keys);
        }
        if (query == "") {
          items.clear();
        }
      });
    }
  }

  Color favClicked() {
    if (favColor == Colors.grey) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  void textMatch(String text) {}

  double searchBoxHeight = 56;
  double searchBoxWidth = 360;
  Color favColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    src_bar.onChangeStream.listen(
      (event) {
        filterSearchResults(event);
      },
    );

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 160,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 200,
                  color: Colors.black,
                ),
                Text('Titolo prodotto')
              ],
            ));
      },
    );
  }
}
