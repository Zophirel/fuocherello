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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    src_bar.stream.listen(
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
        } else {
          setState(
            () {
              bgHeight = MediaQuery.of(context).size.height - 1;
              listCtnHeight = 0;
              carouselOpct = 1;
            },
          );
        }
      },
    );
    AnimationController controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: MediaQuery.of(context).size.height - 1,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Stack(
            children: [
              Container(
                color: Colors.amber,
                child: const Center(
                  child: SearchList(),
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          height: bgHeight,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.primary,
        ),
        AnimatedOpacity(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 100),
          opacity: carouselOpct,
          child: const CarouselPage(),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.loose,
            children: [
              SizedBox(
                height: 56,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    src_bar.SearchBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
