import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdSliderWidget extends StatefulWidget {
  const AdSliderWidget({super.key});

  @override
  State<AdSliderWidget> createState() => _AdSliderWidgetState();
}

class _AdSliderWidgetState extends State<AdSliderWidget> {
  final CarouselController _controller = CarouselController();

  final imageList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.map((imgLink) {
        return Builder(builder: (context) {
          return SizedBox(
            width: 300,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(imgLink),
            ),
          );
        });
      }).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 1),
      ),
    );
  }
}
