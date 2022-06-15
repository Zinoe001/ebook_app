import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/custom_icons.dart';
import 'package:ebook_app/views/bookmark/bookmark_view.dart';
import 'package:ebook_app/views/home/home_view.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

int _selectedPage = 0;
PageController _pageController = PageController(initialPage: 0);

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    onPageChange(int index) {
      setState(() {
        _selectedPage = index;
      });
      _pageController.jumpToPage(index);
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: PageView(
          onPageChanged: onPageChange,
          controller: _pageController,
          children: <Widget>[
            HomeView(),
            BookMarkView(),
            Scaffold(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kBGColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  EBookIcon.home,
                  size: 20,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  EBookIcon.bookmark,
                  size: 20,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  EBookIcon.user,
                  size: 20,
                ),
                label: ""),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kSecondaryColor,
          onTap: onPageChange,
        ),
      ),
    );
  }
}
