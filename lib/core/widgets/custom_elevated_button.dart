import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.onPress,
    this.borderColor,
    required this.titleColor,
  });

  final String title;
  final VoidCallback onPress;
  final Color bgColor;
  final Color? borderColor;
  final Color titleColor;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: widget.bgColor,
        side: BorderSide(
          color: widget.borderColor ?? Colors.transparent,
          width: 2.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),

      onPressed: widget.onPress,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 13),
        child: Text(
          widget.title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            color: widget.titleColor,
          ),
        ),
      ),
    );
  }
}
