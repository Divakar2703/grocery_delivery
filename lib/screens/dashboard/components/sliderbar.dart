import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SliderBar extends StatelessWidget {
  const SliderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0), // Adjust border radius as needed
      ),
      padding: EdgeInsets.all(8.0), // Adjust padding as needed
      child: SizedBox(
        width: double.infinity,
        height: 158,
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage: 0, // Start from the first card
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items: [
            Constants.card1,
            Constants.card2,
            Constants.card3,
          ].map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0), // Adjust margin to create space between items
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0), // Match the container's border radius
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
