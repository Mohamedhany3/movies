import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/features/main_layout/tabs/browse_tab/browser_tab.dart';
import 'package:movie/features/main_layout/tabs/home_tab/home_tab.dart';
import 'package:movie/features/main_layout/tabs/profile_tab/profile_tab.dart';
import 'package:movie/features/main_layout/tabs/search_tab/search_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowserTab(),
    ProfileTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsManager.black,
      body: tabs[selectedIndex],
      bottomNavigationBar: _BottomNavigationBar(),
      // bottomNavigationBar: _bottomNavBar(),
    );
  }

  SizedBox _BottomNavigationBar() {
    return SizedBox(
      height: 120.h,
      child: FloatingNavbar(
        elevation: 0,
        currentIndex: selectedIndex,
        backgroundColor: ColorsManager.gray,
        selectedItemColor: ColorsManager.yellow,
        unselectedItemColor: ColorsManager.white,
        selectedBackgroundColor: Colors.transparent,
        padding: REdgeInsets.all(8),
        onTap: _onTab,
        items: [
          FloatingNavbarItem(
            customWidget: Image.asset(
              selectedIndex == 0 ? IconsNav.homeFilled : IconsNav.home,
              width: 24,
              height: 24,
            ),
          ),
          FloatingNavbarItem(
            customWidget: Image.asset(
              selectedIndex == 1 ? IconsNav.searchFilled : IconsNav.search,
              width: 24,
              height: 24,
            ),
          ),
          FloatingNavbarItem(
            customWidget: Image.asset(
              selectedIndex == 2 ? IconsNav.browserFilled : IconsNav.browser,
              width: 24,
              height: 24,
            ),
          ),
          FloatingNavbarItem(
            customWidget: Image.asset(
              selectedIndex == 3 ? IconsNav.profileFilled : IconsNav.profile,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: selectedIndex,
      backgroundColor: ColorsManager.gray,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.yellow,
      unselectedItemColor: ColorsManager.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onTab,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(IconsNav.home, width: 24, height: 24),
          activeIcon: Image.asset(IconsNav.homeFilled, width: 24, height: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(IconsNav.search, width: 24, height: 24),
          activeIcon: Image.asset(IconsNav.searchFilled, width: 24, height: 24),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(IconsNav.browser, width: 24, height: 24),
          activeIcon: Image.asset(
            IconsNav.browserFilled,
            width: 24,
            height: 24,
          ),
          label: 'Browser',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(IconsNav.profile, width: 24, height: 24),
          activeIcon: Image.asset(
            IconsNav.profileFilled,
            width: 24,
            height: 24,
          ),
          label: 'Profile',
        ),
      ],
    );
  }

  void _onTab(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }
}
