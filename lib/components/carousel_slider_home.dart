import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/models/foods.dart';

class CarroselFoodListView1 extends StatelessWidget {
  const CarroselFoodListView1({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 120.0,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
      ),
      items: foodslist
          .map((item) => SizedBox(
                child: Center(
                    child: ClipRRect(borderRadius: BorderRadius.circular(12) ,child: Image.asset(item.path, fit: BoxFit.cover, width: 1000)),),
              ),)
          .toList(),
    );
  }
}

