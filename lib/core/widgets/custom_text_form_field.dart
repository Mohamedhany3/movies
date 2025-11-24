import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.controller,
    this.isSecure = false,
    this.enabled = true,
  });
  final String hint;
  final Widget? suffixIcon;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool isSecure;
  final bool enabled;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: ColorsManager.white,
      obscureText: widget.isSecure,
      style: TextStyle(color: ColorsManager.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.gray,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.gray, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.gray, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 2.w),
        ),
        hintText: widget.hint,
        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: ColorsManager.white,
        ),
        suffixIcon: widget.suffixIcon == null ? null : widget.suffixIcon,
        suffixIconColor: ColorsManager.white,
        prefixIcon: Icon(widget.prefixIcon),
        prefixIconColor: ColorsManager.white,
      ),
    );
  }
}
