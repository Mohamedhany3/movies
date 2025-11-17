import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/recources/assets_manager/assets_manager.dart';
import '../core/recources/colors_manager/colors_manager.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.image,
    required this.rate,
    required this.widthImage,
  });

  final String image;
  final String rate;
  final double widthImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        Container(
          margin: REdgeInsets.symmetric(horizontal: 16),
          width: widthImage,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // Rating
        Container(
          margin: EdgeInsets.only(left: 30, top: 9),
          height: 28,
          width: 58,
          decoration: BoxDecoration(
            color: ColorsManager.black.withOpacity(0.71),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                rate,
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.white,
                ),
              ),
              SizedBox(width: 4.w),
              Image.asset(ImageAssets.star, width: 15.w, height: 15.h),
            ],
          ),
        ),
      ],
    );
  }
}
