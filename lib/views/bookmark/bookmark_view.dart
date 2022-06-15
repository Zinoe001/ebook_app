import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:ebook_app/models/ebook_model.dart';
import 'package:ebook_app/views/bookmark/components/bookmark_card.dart';
import 'package:ebook_app/views/bookmark/components/bookmark_ebook_view.dart';
import 'package:flutter/material.dart';

class BookMarkView extends StatefulWidget {
  const BookMarkView({Key? key}) : super(key: key);

  @override
  State<BookMarkView> createState() => _BookMarkViewState();
}

class _BookMarkViewState extends State<BookMarkView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));
  late List<Map<String, dynamic>> ebook = [];
  late List<Map<String, dynamic>> bookmark = [];
  var unique = Set<Map<String, dynamic>>();
  @override
  void initState() {
    getEbookList();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
    _controller.forward();
  }

  getEbookList() {
    setState(() {
      ebook.addAll(EbookFunctions.bookmarkList);
      bookmark.addAll(ebook.where((element) => unique.add(element)).toList());
      print(bookmark.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kBGColor,
            pinned: true,
            title: TweenAnimationBuilder(
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(top: value * 5),
                      child: child,
                    ));
              },
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 2),
              child: AppText.heading2SB(
                "BookMark",
                color: kPrimaryColor,
              ),
            ),
          ),
          SliverAnimatedList(
            initialItemCount: bookmark.length,
            itemBuilder: (context, index, animate) => SlideTransition(
              position: _offsetAnimation,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookmarkEbookView(
                      id: int.parse(bookmark[index]["id"]),
                      author: bookmark[index]["author"][0],
                      cover: bookmark[index]["cover"],
                      rating: bookmark[index]["rating"],
                      title: bookmark[index]["name"],
                      pages: bookmark[index]["pages"],
                      published: bookmark[index]["published"],
                      synopsis: bookmark[index]["synopsis"],
                      url: bookmark[index]["url"],
                    ),
                  ),
                ),
                child: BookMarkCard(
                  author: bookmark[index]["author"][0],
                  cover: bookmark[index]["cover"],
                  rating: bookmark[index]["rating"],
                  name: bookmark[index]["name"],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
