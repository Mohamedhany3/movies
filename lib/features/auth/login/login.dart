import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/core/recources/routes_manager/routes_manager.dart';
import 'package:movie/core/recources/validator.dart';
import 'package:movie/core/widgets/custom_elevated_button.dart';
import 'package:movie/core/widgets/custom_text_button.dart';
import 'package:movie/core/widgets/custom_text_form_field.dart';
import 'package:movie/core/widgets/language_selector.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool securedPassword = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _validator = Validator();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsManager.black,

      body: Form(
        key: _formKey,
        child: Padding(
          padding: REdgeInsets.symmetric(
            vertical: MediaQuery.of(context).viewInsets.top,
            horizontal: 19,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30.h),
                    Image.asset(
                      ImageAssets.moviesLogo,
                      width: 121.w,
                      height: 118.h,
                    ),
                    SizedBox(height: 69.h),
                    CustomTextFormField(
                      validator: _validator.validateEmail,
                      controller: _emailController,
                      hint: "Email",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_rounded,
                    ),
                    SizedBox(height: 22.h),
                    CustomTextFormField(
                      validator: _validator.validatePassword,
                      controller: _passwordController,
                      hint: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      isSecure: securedPassword,
                      prefixIcon: Icons.lock_rounded,
                      suffixIcon: IconButton(
                        onPressed: _onPasswordIconClicked,
                        icon: securedPassword
                            ? Icon(Icons.visibility_off_rounded)
                            : Icon(Icons.visibility_rounded),
                      ),
                    ),
                    SizedBox(height: 17.h),
                    CustomTextButton(
                      title: "Forget Password ?",
                      textAlign: TextAlign.right,
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.forgetPass);
                      },
                    ),
                    SizedBox(height: 22.h),
                    CustomElevatedButton(
                      title: "Login",
                      bgColor: ColorsManager.yellow,
                      onPress: _login,
                      titleColor: ColorsManager.black,
                    ),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have Account ? ",
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.white,
                          ),
                        ),
                        CustomTextButton(
                          title: "Create One",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.register,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ColorsManager.yellow,
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                        ),
                        Text(
                          "OR",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: ColorsManager.yellow,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: ColorsManager.yellow,
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 27.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorsManager.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.googleIcon,
                            height: 26.h,
                            width: 26.w,
                          ),
                          SizedBox(width: 10.w),
                          Padding(
                            padding: REdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Login With Google",
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsManager.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33.h),
                LanguageSelector(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPasswordIconClicked() {
    setState(() {
      securedPassword = !securedPassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;
  }
}
