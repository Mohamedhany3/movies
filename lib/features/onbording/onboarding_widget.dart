import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/recources/colors_manager/colors_manager.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.titleButton,
    required this.dis,
    required this.color,
    required this.visible,
    required this.onPressNext,
    required this.onPressBack,
  });

  final String imageAsset;
  final Color color;
  final String title;
  final String titleButton;
  final String dis;
  final bool visible;
  final VoidCallback onPressNext;
  final VoidCallback onPressBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(child: Image.asset(imageAsset, fit: BoxFit.fill)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  color.withOpacity(.2),
                  color.withOpacity(.4),
                  color.withOpacity(.6),
                  color.withOpacity(.66),
                  color.withOpacity(.9),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            ),
            child: Padding(
              padding: REdgeInsets.only(
                top: 34,
                left: 16,
                right: 16,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    dis,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  // CustomElevatedButton(
                  //   title: titleButton,
                  //   bgColor: ColorsManager.yellow,
                  //   onPress: onPressNext,
                  //   titleColor: ColorsManager.black,
                  // ),
                  SizedBox(height: 14.h),
                  // Visibility(
                  //   visible: visible,
                  //   child: CustomElevatedButton(
                  //     title: "Back",
                  //     bgColor: Colors.transparent,
                  //     onPress: onPressBack,
                  //     titleColor: ColorsManager.yellow,
                  //     borderColor: ColorsManager.yellow,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
