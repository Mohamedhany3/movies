import 'package:flutter/material.dart';
import 'package:movie/features/main_layout/main_layout.dart';
import '../../../features/onbording/onboarding.dart';
import '../../../features/onbording/onboarding_details.dart';
import '../../../features/splash/splash_screen.dart';

abstract class RoutesManager {
  static const String splash = "/Splash";
  static const String onboarding = "/Onboarding";
  static const String onboardingDetails = "/OnboardingDetails";
  static const String mainLayout = "/MainLayout";

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onboarding: (context) => Onboarding(),
    onboardingDetails: (context) => OnboardingDetails(),
    mainLayout: (context) => MainLayout(),
  };
}
