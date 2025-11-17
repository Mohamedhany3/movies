import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.yellow, width: 2.w),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              selectedIndex = 0;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: selectedIndex == 0
                      ? ColorsManager.yellow
                      : Colors.transparent,
                  width: 5.w,
                ),
              ),
              child: Image.asset(ImageAssets.lr, height: 26.h, width: 26.w),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              selectedIndex = 1;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: selectedIndex == 1
                      ? ColorsManager.yellow
                      : Colors.transparent,
                  width: 5.w,
                ),
              ),
              child: Image.asset(ImageAssets.eg, height: 26.h, width: 26.w),
            ),
          ),
        ],
      ),
    );
  }
}
