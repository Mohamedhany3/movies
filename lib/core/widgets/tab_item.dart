import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/model/category_model.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.isSelected, required this.category});
  final bool isSelected;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.yellow : ColorsManager.black,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.yellow, width: 2.w),
      ),

      child: Text(
        category.name,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: isSelected ? ColorsManager.black : ColorsManager.yellow,
        ),
      ),
    );
  }
}
