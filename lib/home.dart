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
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        duration: const Duration(milliseconds: 300),
        color: Colors.blue,
        child: const Padding(
          padding: EdgeInsets.only(top: 100),
          child: SearchList(),
        ),
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        height: bgHeight,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.primary,
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
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 300),
        color: Colors.blue,
        child: const Padding(
          padding: EdgeInsets.only(top: 150),
          child: SizedBox(width: 300, child: SearchList()),
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
            const Duration(milliseconds: 200),
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
