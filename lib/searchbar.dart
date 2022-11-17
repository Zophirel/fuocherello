import 'dart:async';
import 'package:flutter/material.dart';

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

StreamController onTapController = StreamController.broadcast();
StreamController onChangeController = StreamController.broadcast();
Stream onTapStream = onTapController.stream;
Stream onChangeStream = onChangeController.stream;
TextEditingController searchInput = TextEditingController();

class _SearchBarState extends State<SearchBar> {
  FocusNode focusNode = FocusNode();
  double searchBoxHeight = 56;
  double searchBoxWidth = 300;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 380) {
      setState(() {
        searchBoxWidth = MediaQuery.of(context).size.width - 80;
      });
    } else {
      setState(() {
        searchBoxWidth = 360;
      });
    }
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(
          () {
            onTapController.add(clicked);
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

    return WillPopScope(
        onWillPop: (() async {
          FocusManager.instance.primaryFocus?.unfocus();
          return false;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
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
              controller: searchInput,
              focusNode: focusNode,
              onTap: () async {
                if (clicked == false) {
                  clicked = await barClicked();
                  onTapController.add(clicked);
                }
              },
              onChanged: (string) async {
                onChangeController.add(string);
              },
              onEditingComplete: () async {},
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), border: InputBorder.none),
            ),
          ),
        ));
  }
}
