import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/recources/assets_manager/assets_manager.dart';
import '../../core/recources/colors_manager/colors_manager.dart';
import '../../core/recources/routes_manager/routes_manager.dart';
import 'onboarding_widget.dart';

class OnboardingDetails extends StatefulWidget {
  OnboardingDetails({super.key});

  @override
  State<OnboardingDetails> createState() => _OnboardingDetailsState();
}

class _OnboardingDetailsState extends State<OnboardingDetails> {
  int selectedIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (index) {
          selectedIndex = index;
          setState(() {});
        },
        // physics: NeverScrollableScrollPhysics(),
        children: [
          OnboardingWidget(
            visible: false,
            onPressBack: () {},
            onPressNext: () {
              controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            },
            imageAsset: ImageAssets.on1,
            title: "Discover Movies",
            titleButton: "Next",
            dis:
                "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
            color: Color(0xFF084250),
          ),
          OnboardingWidget(
            visible: true,
            onPressBack: () {
              controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            onPressNext: () {
              controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            imageAsset: ImageAssets.on2,
            title: "Explore All Genres",
            titleButton: "Next",
            dis:
                "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
            color: Color(0xFF85210E),
          ),
          OnboardingWidget(
            visible: true,
            onPressBack: () {
              controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            onPressNext: () {
              controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            imageAsset: ImageAssets.on3,
            title: "Create WatchLists",
            titleButton: "Next",
            dis:
                "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
            color: Color(0xFF4C2471),
          ),
          OnboardingWidget(
            visible: true,
            onPressBack: () {
              controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            onPressNext: () {
              controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            imageAsset: ImageAssets.on4,
            title: "Rate, Review, and Learn",
            titleButton: "Next",
            dis:
                "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
            color: Color(0xFF601321),
          ),
          OnboardingWidget(
            visible: true,
            onPressBack: () {
              controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            onPressNext: () {
              Navigator.pushReplacementNamed(context, RoutesManager.splash);
              setState(() {});
            },
            imageAsset: ImageAssets.on5,
            title: "Start Watching Now",
            titleButton: "Finish",
            dis: '',
            color: Color(0xFF2A2C30),
          ),
        ],
      ),
    );
  }
}
