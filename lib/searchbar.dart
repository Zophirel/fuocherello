import 'dart:async';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

bool clicked = false;
Future<bool> barClicked() async {
  return !clicked;
}

StreamController controller = StreamController.broadcast();
Stream stream = controller.stream;

class _SearchBarState extends State<SearchBar> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  double searchBoxHeight = 56;
  double searchBoxWidth = 360;

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(
          () {
            controller.add(clicked);
          },
        );
      } else {
        setState(
          () {
            searchBoxWidth = 360;
          },
        );
      }
    });

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: searchBoxHeight,
      width: searchBoxWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.only(left: 10, top: 4, right: 15),
        child: TextField(
          focusNode: focusNode,
          onTap: () async {
            if (clicked == false) {
              clicked = await barClicked();
              controller.add(clicked);
            }
          },
          onChanged: (string) async {
            //clicked = await barClicked();
            //print(string);
          },
          onEditingComplete: () async {
            //clicked = await barClicked();
            //print('complete string');
          },
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), border: InputBorder.none),
        ),
      ),
    );
  }
}
