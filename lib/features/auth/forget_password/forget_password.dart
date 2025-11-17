import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/core/recources/validator.dart';
import 'package:movie/core/widgets/custom_elevated_button.dart';
import 'package:movie/core/widgets/custom_text_form_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _emailController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _validator = Validator();

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.yellow,
        title: Text(
          "Forget Password",
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.yellow,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: 16,
            vertical: MediaQuery.of(context).viewInsets.top,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                ImageAssets.forgetPassword,
                height: 430.h,
                width: 430.w,
              ),
              SizedBox(height: 24.h),
              CustomTextFormField(
                validator: _validator.validateEmail,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hint: "Email",
                prefixIcon: Icons.email_rounded,
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                title: "Verify Email ",
                bgColor: ColorsManager.yellow,
                onPress: () {},
                titleColor: ColorsManager.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
