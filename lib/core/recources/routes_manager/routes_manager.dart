import 'package:flutter/material.dart';
import 'package:movie/features/auth/presentation/screens/forget_password/forget_password.dart';
import 'package:movie/features/auth/presentation/screens/login/login.dart';
import 'package:movie/features/auth/presentation/screens/register/register.dart';
import 'package:movie/features/main_layout/main_layout.dart';
import 'package:movie/features/main_layout/tabs/browse_tab/browser_tab.dart';
import 'package:movie/features/main_layout/tabs/profile_tab/profile_tab.dart';
import 'package:movie/features/main_layout/tabs/search_tab/search_tab.dart';
import '../../../features/main_layout/tabs/home_tab/home_tab.dart';
import '../../../features/onbording/onboarding.dart';
import '../../../features/onbording/onboarding_details.dart';
import '../../../features/splash/splash_screen.dart';

abstract class RoutesManager {
  static const String splash = "/Splash";
  static const String onboarding = "/Onboarding";
  static const String onboardingDetails = "/OnboardingDetails";
  static const String mainLayout = "/MainLayout";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPass = "/forgetPass";
  static const String homeTab = "/HomeTab";
  static const String searchTab = "/SearchTab";
  static const String browserTab = "/BrowserTab";
  static const String profileTab = "/Profile";

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onboarding: (context) => Onboarding(),
    onboardingDetails: (context) => OnboardingDetails(),
    login: (context) => Login(),
    register: (context) => Register(),
    forgetPass: (context) => ForgetPassword(),
    mainLayout: (context) => MainLayout(),
    homeTab: (context) => HomeTab(),
    searchTab: (context) => SearchTab(),
    browserTab: (context) => BrowserTab(),
    profileTab: (context) => ProfileTab(),
  };
}
