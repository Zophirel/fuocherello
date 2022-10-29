import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        height: 170,
        enableInfiniteScroll: false,
      ),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: 360,
              height: 170,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 20),
                child: LayoutGrid(
                  areas: ''' 
                        txtHeader    img
                        txtSubHeader img
                        ''',
                  columnSizes: [180.px, 180.px],
                  rowSizes: [100.px, 50.px],
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: FittedBox(
                              child: Text(
                                '50%',
                                style: TextStyle(
                                    fontSize: 70.sp,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).inGridArea('txtHeader'),
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'su tutta la legna',
                              style: TextStyle(fontSize: 20.sp, height: 0),
                            ),
                          )
                        ],
                      ),
                    ).inGridArea('txtSubHeader'),
                    SizedBox(
                      height: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage('assets/android/home/legna.png'),
                            height: 120,
                          ),
                        ],
                      ),
                    ).inGridArea('img')
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
