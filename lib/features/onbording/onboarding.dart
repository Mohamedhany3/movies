import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/recources/assets_manager/assets_manager.dart';
import '../../core/recources/colors_manager/colors_manager.dart';
import '../../core/recources/routes_manager/routes_manager.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Stack(
        children: [
          Image.asset(ImageAssets.postersOnboarding),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ColorsManager.black.withOpacity(0.2),
                  ColorsManager.black.withOpacity(0.3),
                  ColorsManager.black.withOpacity(0.55),
                  ColorsManager.black.withOpacity(0.98),
                  ColorsManager.black.withOpacity(0.9999),
                ],
              ),
            ),
          ),
          Container(
            margin: REdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Find Your Next Favorite Movie Here",
                  style: GoogleFonts.inter(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Get access to a huge library of movies\n to suit all tastes. You will surely like it.",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                // CustomElevatedButton(
                //   title: "Explore Now",
                //   bgColor: ColorsManager.yellow,
                //   onPress: () {
                //     Navigator.pushReplacementNamed(
                //       context,
                //       RoutesManager.onboardingDetails,
                //     );
                //   },
                //   titleColor: ColorsManager.black,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
