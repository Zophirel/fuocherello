import 'dart:async';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SearchList(),
    );
  }
}

class SearchList extends StatefulWidget {
  const SearchList({
    super.key,
  });

  @override
  State<SearchList> createState() => _SearchListState();
}

bool clicked = false;
Future<bool> barClicked() async {
  return !clicked;
}

StreamController controller = StreamController.broadcast();
Stream stream = controller.stream;

class _SearchListState extends State<SearchList> {
  @override
  void initState() {
    super.initState();
  }

  double searchBoxHeight = 56;
  double searchBoxWidth = 360;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 78),
      color: Colors.white,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing: const Text(
                  "GFG",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("List item $index"));
          }),
    );
  }
}
