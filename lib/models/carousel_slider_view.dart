import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dilkara/models/banner_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'add_banner.dart';

class CarouselSliderView extends StatefulWidget {
  final List<AdBanner> bannerlist;
  const CarouselSliderView({Key? key, required this.bannerlist})
      : super(key: key);

  _CarouselSliderViewState createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    _bannerList =
        widget.bannerlist.map((e) => BannerCard(imageUrl: e.image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items:_bannerList,
            options: CarouselOptions(
              autoPlay:true,
            ))
      ],
    );
  }
}
