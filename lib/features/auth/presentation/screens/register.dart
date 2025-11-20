import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/core/recources/routes_manager/routes_manager.dart';
import 'package:movie/core/recources/validator.dart';
import 'package:movie/core/ui_utils/ui_utils.dart';
import 'package:movie/core/widgets/custom_elevated_button.dart';
import 'package:movie/core/widgets/custom_text_button.dart';
import 'package:movie/core/widgets/custom_text_form_field.dart';
import 'package:movie/core/widgets/language_selector.dart';
import 'package:movie/core/widgets/avatar_slider.dart';
import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/presentation/cubit/auth_cubit.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;
  late TextEditingController _phoneController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _validator = Validator();
  bool securedPassword = true;
  bool securedRePassword = true;
  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    _phoneController = TextEditingController();
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
          "Register",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: ColorsManager.yellow,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 200.h, child: AvatarSlider()),

            Padding(
              padding: REdgeInsets.symmetric(
                horizontal: 16,
                vertical: MediaQuery.of(context).viewInsets.top,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "Avatar",
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextFormField(
                        validator: _validator.validateName,
                        controller: _nameController,
                        hint: "Name",
                        prefixIcon: Icons.person_rounded,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        validator: _validator.validateEmail,
                        controller: _emailController,
                        hint: "Email",
                        prefixIcon: Icons.email_rounded,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        validator: _validator.validatePassword,
                        controller: _passwordController,
                        isSecure: securedPassword,
                        hint: "Password",
                        prefixIcon: Icons.lock_rounded,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: _onPasswordIconClicked,
                          icon: securedPassword
                              ? Icon(Icons.visibility_off_rounded)
                              : Icon(Icons.visibility_rounded),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        validator: (value) => _validator.validateRePassword(
                          value,
                          _passwordController.text,
                        ),
                        controller: _rePasswordController,
                        isSecure: securedRePassword,
                        hint: "Confirm Password",
                        prefixIcon: Icons.lock_rounded,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: _onRePasswordIconClicked,
                          icon: securedRePassword
                              ? Icon(Icons.visibility_off_rounded)
                              : Icon(Icons.visibility_rounded),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        validator: _validator.validatePhoneNumber,
                        controller: _phoneController,
                        hint: "Phone Number",
                        prefixIcon: Icons.phone_rounded,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.h),
                      BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LoadingState) {
                            UIUtils.showLoading(context);
                          } else if (state is ErrorState) {
                            UIUtils.hideDialog(context);
                            UIUtils.showToastMessage(
                              state.message,
                              ColorsManager.red,
                            );
                          } else if (state is SuccessState) {
                            UIUtils.hideDialog(context);
                            UIUtils.showToastMessage(
                              "Registered Successfully",
                              Colors.green,
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesManager.login,
                            );
                          }
                        },
                        child: CustomElevatedButton(
                          title: "Create Account",
                          bgColor: ColorsManager.yellow,
                          onPress: _createAccount,
                          titleColor: ColorsManager.black,
                        ),
                      ),
                      SizedBox(height: 17.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have Account ? ",
                            style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.white,
                            ),
                          ),
                          CustomTextButton(
                            title: "Login",
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesManager.login,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  LanguageSelector(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onPasswordIconClicked() {
    setState(() {
      securedPassword = !securedPassword;
    });
  }

  void _onRePasswordIconClicked() {
    setState(() {
      securedRePassword = !securedRePassword;
    });
  }

  void _createAccount() {
    if (!_formKey.currentState!.validate()) return;
    BlocProvider.of<AuthCubit>(context).register(
      RegisterRequest(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _rePasswordController.text,
        phone: _phoneController.text,
        avatarId: 1,
      ),
    );
  }
}
