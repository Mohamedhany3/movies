import 'package:flutter/material.dart';
import '../../../features/onbording/onboarding.dart';
import '../../../features/onbording/onboarding_details.dart';
import '../../../features/splash/splash_screen.dart';

abstract class RoutesManager {
  static const String splash = "/splash";
  static const String onboarding = "/Onboarding";
  static const String onboardingDetails = "/onboardingDetails";

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onboarding: (context) => Onboarding(),
    onboardingDetails: (context) => OnboardingDetails(),
  };
}
