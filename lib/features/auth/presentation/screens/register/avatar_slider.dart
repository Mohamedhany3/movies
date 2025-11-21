import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/model/avatar_model.dart';

class AvatarSlider extends StatefulWidget {
  const AvatarSlider({super.key});

  @override
  State<AvatarSlider> createState() => _AvatarSliderState();
}

class _AvatarSliderState extends State<AvatarSlider> {
  int selectedAvatarId = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 161.h,
        enlargeCenterPage: true,
        disableCenter: true,
        enlargeFactor: .6,
        viewportFraction: 0.38,
        onPageChanged: (index, reason) {
          setState(() {
            selectedAvatarId = ++index;
          });
        },
      ),

      items: AvatarModel.avatars.map((avatar) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(avatar.imagePath);
          },
        );
      }).toList(),
    );
  }
}
