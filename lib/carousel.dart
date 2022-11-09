import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselItems {
  const CarouselItems(
      {required this.text, required this.subText, required this.imgPath});
  final String text;
  final String subText;
  final String imgPath;
}

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: CarouselPage(),
    );
  }
}

class CarouselPage extends StatefulWidget {
  const CarouselPage({
    super.key,
  });

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        height: 260,
        enableInfiniteScroll: false,
      ),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.only(top: 100),
              height: 170,
              width: 360,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          FittedBox(
                            child: Text(
                              '50%',
                              style: TextStyle(
                                  height: 0.8,
                                  fontSize: 84,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              'su tutta la legna',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 130,
                            child: Image(
                              image:
                                  AssetImage('assets/android/home/legna.png'),
                              height: 130,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
