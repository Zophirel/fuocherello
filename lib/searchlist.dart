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
          margin: const EdgeInsets.only(top: 10),
          height: 170,
          width: 360,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.black,
                        ),
                        width: 140,
                        height: 140,
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/android/home/legna.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          items[index],
                          style: const TextStyle(
                              fontSize: 84, fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ),
                      const FittedBox(
                        child: Text(
                          'nome citta - orario pubblicazione',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const FittedBox(
                        child: Text(
                          '100\$',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 12.6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: (() {
                              setState(() {
                                favColor = favColor == Colors.grey
                                    ? Colors.red
                                    : Colors.grey;
                              });
                            }),
                            color: favColor,
                            icon: const Icon(Icons.bookmark),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
