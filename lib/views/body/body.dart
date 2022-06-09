import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/custom_icons.dart';
import 'package:ebook_app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      Scaffold(),
      Scaffold(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          EBookIcon.home,
          size: 20,
        ),
        // title: ("Search"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          EBookIcon.bookmark,
          size: 20,
        ),
        // title: ("Home"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          EBookIcon.user,
          size: 20,
        ),
        // title: ("Settings"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kSecondaryColor,
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0XFF1A2232), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color(0XFF1A2232),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }
}
