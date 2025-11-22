import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/recources/colors_manager/colors_manager.dart';

class CustomContainerData extends StatelessWidget {
  const CustomContainerData({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(left: 18),
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: ColorsManager.gray,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: ColorsManager.white),
          SizedBox(width: 14.w),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
