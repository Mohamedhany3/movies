import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/model/avatar_model.dart';

class AvatarSlider extends StatelessWidget {
  const AvatarSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: true,
        enlargeFactor: 0.7,
        viewportFraction: 0.4,
      ),
      items: AvatarModel.avatars.map((avatar) {
        return Image.asset(avatar.imagePath);
      }).toList(),
    );
  }
}
