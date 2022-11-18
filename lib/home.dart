import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:fuocherello/carousel.dart';
import 'searchbar.dart' as src_bar;
import 'searchlist.dart';
import 'carousel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentPageIndex = 0;
  double carouselOpct = 1;
  double searchListWidth = 0;
  double listCtnHeight = 0;
  double listCtnWidth = 0;
  double searchListCtnHeight = 0;
  double srcBoxHeight = 0;
  double bgHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  late List<Widget> homepageInitComponents, homepageSearchOpen, screenState;

  @override
  void initState() {
    super.initState();
  }

  void setComponents(bool opened) {
    homepageInitComponents = [
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.primary,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          height: searchListCtnHeight,
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 300),
          color: Colors.white,
          curve: Curves.easeInOut,
          child: const Padding(
            padding: EdgeInsets.only(top: 100),
            child: SearchList(),
          ),
        ),
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: srcBoxHeight,
        color: Colors.amber,
        curve: Curves.easeInOut,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 56, 10, 10),
        child: AnimatedOpacity(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 100),
          opacity: carouselOpct,
          child: const CarouselPage(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 56, 10, 10),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: [
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      const src_bar.SearchBar(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    homepageSearchOpen = [
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.primary,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          height: searchListCtnHeight,
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 300),
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.only(top: 100),
            child: SearchList(),
          ),
        ),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: srcBoxHeight,
        color: Colors.amber,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 56, 10, 10),
        child: AnimatedOpacity(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 100),
          opacity: carouselOpct,
          child: const CarouselPage(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 56, 10, 10),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: [
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      const src_bar.SearchBar(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ];

    /* homepageSearchOpen = [
      AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        duration: const Duration(milliseconds: 300),
        color: Colors.blue,
        child: AnimatedContainer(
          duration: const Duration(microseconds: 600),
          height: MediaQuery.of(context).size.height - 200,
          alignment: Alignment.topCenter,
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: SizedBox(
              width: 300,
              child: SearchList(),
            ),
          ),
        ),
      ),
      Container(
        color: Colors.amber,
        height: srcBoxHeight,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 56, 10, 10),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: [
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      const src_bar.SearchBar(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
    */
    if (!opened) {
      screenState = homepageInitComponents;
    } else {
      screenState = homepageSearchOpen;
    }
  }

  Color favColor = Colors.grey;
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    setComponents(opened);
    src_bar.onTapStream.listen(
      (event) {
        if (event) {
          setState(
            () {
              carouselOpct = 0;
              bgHeight = 0;
              listCtnHeight = MediaQuery.of(context).size.height - 1;
              listCtnWidth = MediaQuery.of(context).size.width;
              srcBoxHeight = 130;
              searchListCtnHeight = MediaQuery.of(context).size.height - 130;
            },
          );
          Future.delayed(
            const Duration(milliseconds: 300),
            (() {
              setState(() {
                opened = true;
              });
            }),
          );
        } else {
          setState(
            () {
              bgHeight = MediaQuery.of(context).size.height - 1;
              listCtnHeight = 0;
              carouselOpct = 1;
            },
          );
          Future.delayed(
            const Duration(milliseconds: 300),
            (() {
              setState(() {
                opened = false;
              });
            }),
          );
        }
      },
    );

    return Stack(
      children: screenState,
    );
  }
}
