import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/recources/routes_manager/routes_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: Size(430, 932),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.splash,
        locale: Locale("en"),
      ),
    );
  }
}
