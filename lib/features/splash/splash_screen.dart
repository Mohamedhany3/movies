import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/recources/assets_manager/assets_manager.dart';
import '../../core/recources/colors_manager/colors_manager.dart';
import '../../core/recources/routes_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesManager.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              ImageAssets.moviesLogo,
              height: 118.h,
              width: 121.w,
            ),
          ),
          Spacer(),
          Image.asset(ImageAssets.routeLogo),
          SizedBox(height: 10.h),
          Text(
            "Supervised by Mohamed Hany",
            style: GoogleFonts.poppins(
              color: ColorsManager.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
