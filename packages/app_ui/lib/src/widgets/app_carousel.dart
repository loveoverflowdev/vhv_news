
// ignore_for_file: public_member_api_docs

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatelessWidget {
  const AppCarousel({
    required this.itemBuilder, 
    required this.itemCount, 
    super.key, 
    this.onPageChanged,
    this.height,
  });

  final double? height;
  final int? itemCount;
  final Widget Function(BuildContext, int, int)? itemBuilder;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    if (itemCount == null || itemCount == 0 || itemBuilder == null) {
      return const SizedBox.shrink();
    }
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        height: height ?? 200,
        // aspectRatio: 16 / 9,
        // viewportFraction: 0.8,
        // initialPage: 0,
        // enableInfiniteScroll: true,
        // reverse: false,
        autoPlay: false,
        // autoPlayInterval: const Duration(seconds: 3),
        // autoPlayAnimationDuration: const Duration(milliseconds: 800),
        // autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // enlargeFactor: 0.3,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
