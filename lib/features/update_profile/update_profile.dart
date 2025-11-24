import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/core/widgets/custom_elevated_button.dart';
import 'package:movie/core/widgets/custom_text_form_field.dart';
import 'package:movie/features/update_profile/custom_container_data.dart';
import 'package:movie/model/avatar_model.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  int avatarID = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        foregroundColor: ColorsManager.yellow,
        backgroundColor: ColorsManager.black,
        centerTitle: true,
        title: Text(
          'Pick Avatar',
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            color: ColorsManager.yellow,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.only(left: 16, right: 16, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //avatar
            Image.asset(
              AvatarModel.avatars[avatarID].imagePath,
              height: 150.h,
              width: 150.w,
            ),
            SizedBox(height: 35.h),

            // name
            CustomContainerData(title: "Mohamed Hany", icon: Icons.person),
            SizedBox(height: 20.h),

            //phone
            CustomContainerData(
              title: "01222222222222",
              icon: Icons.phone_rounded,
            ),
            SizedBox(height: 30.h),
            // Reset password
            GestureDetector(
              onTap: () {},
              child: Text(
                "Reset Password",
                style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(),
            // delete
            CustomElevatedButton(
              title: "Delete Account",
              bgColor: ColorsManager.red,
              onPress: () {},
              titleColor: ColorsManager.white,
            ),
            SizedBox(height: 19.h),
            //update
            CustomElevatedButton(
              title: "Update Data",
              bgColor: ColorsManager.yellow,
              onPress: _updateProfile,
              titleColor: ColorsManager.black,
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfile() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 400,
          margin: REdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorsManager.gray,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    avatarID = index;
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  padding: REdgeInsets.all(5),
                  margin: REdgeInsets.all(19),
                  decoration: BoxDecoration(
                    color: avatarID == index
                        ? ColorsManager.yellow.withOpacity(.56)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(width: 2, color: ColorsManager.yellow),
                  ),
                  child: Image.asset(AvatarModel.avatars[index].imagePath),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
