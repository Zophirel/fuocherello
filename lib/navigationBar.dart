import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fuocherello/searchbar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:fuocherello/carousel.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: NavBarPage(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage>
    with SingleTickerProviderStateMixin {
  int currentPageIndex = 0;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  bool pressed = false;
  late IconButton searchFieldBtn;

  Widget searchField() {
    return searchFieldBtn = IconButton(
      iconSize: 30.0,
      icon: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 0),
          child: pressed == true
              ? const Icon(Icons.close)
              : const Icon(Icons.search)),
      onPressed: () {
        setState(
          () {
            pressed = !pressed;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
      body: [
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: Column(
              children: const [SearchBar(), CarouselPage()],
            ),
          ),
        ),
        Container(color: Colors.grey),
        Container(color: Colors.white),
      ][currentPageIndex],
    );
  }
}
