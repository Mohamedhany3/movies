import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/core/recources/routes_manager/routes_manager.dart';
import 'package:movie/core/widgets/custom_elevated_button.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Data User
        Padding(
          padding: REdgeInsets.only(left: 20, right: 20, top: 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Avatar and name
              Column(
                children: [
                  Image.asset(ImageAssets.av1, width: 118.w),
                  SizedBox(height: 15.h),
                  Text(
                    "Mohamed Hany",
                    style: GoogleFonts.roboto(
                      color: ColorsManager.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // With List
              Column(
                children: [
                  Text(
                    '5',
                    style: GoogleFonts.roboto(
                      color: ColorsManager.white,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    'Wish List',
                    style: GoogleFonts.roboto(
                      color: ColorsManager.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // History
              Column(
                children: [
                  Text(
                    '14',
                    style: GoogleFonts.roboto(
                      color: ColorsManager.white,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    'History',
                    style: GoogleFonts.roboto(
                      color: ColorsManager.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        // Edit && Exit
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomElevatedButton(
                  title: "Edit Profile",
                  bgColor: ColorsManager.yellow,
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      RoutesManager.updateProfileTab,
                    );
                  },
                  titleColor: ColorsManager.black,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 1,
                child: CustomElevatedButton(
                  title: " Exit ",
                  bgColor: ColorsManager.red,
                  onPress: () {},
                  titleColor: ColorsManager.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        _tabBar(),

        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(ImageAssets.empty, width: 124.w)],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(ImageAssets.on2, width: 124.w)],
              ),
            ],
          ),
        ),
      ],
    );
  }

  TabBar _tabBar() {
    return TabBar(
      dividerColor: Colors.transparent,
      indicatorColor: ColorsManager.yellow,
      indicatorWeight: 3,
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
      unselectedLabelStyle: GoogleFonts.roboto(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
      tabs: [
        Tab(
          icon: Image.asset(IconProfile.watch, width: 30.w),
          text: "Watch List",
          iconMargin: EdgeInsets.all(10),
          height: 90.h,
        ),
        Tab(
          icon: Image.asset(IconProfile.history, width: 30.w),
          text: "History",
          iconMargin: EdgeInsets.all(10),
          height: 90.h,
        ),
      ],
    );
  }
}
