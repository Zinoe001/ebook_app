import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/custom_icons.dart';
import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:ebook_app/widgets/curve_line_paint.dart';
import 'package:ebook_app/widgets/ebook_snackbar.dart';
import 'package:ebook_app/widgets/my_list.dart';
import 'package:ebook_app/widgets/web_view.dart';
import 'package:flutter/material.dart';

class BookmarkEbookView extends StatefulWidget {
  const BookmarkEbookView(
      {Key? key,
      required this.id,
      required this.cover,
      required this.title,
      required this.author,
      required this.pages,
      required this.published,
      required this.synopsis,
      required this.url,
      required this.rating})
      : super(key: key);
  final int id;
  final String cover;
  final String title;
  final String author;
  final String pages;
  final String published;
  final String synopsis;
  final String url;
  final String rating;
  static final EbookFunctions _function = EbookFunctions();
  static final EbookFlushbar _flushbar = EbookFlushbar();

  @override
  State<BookmarkEbookView> createState() => _BookmarkEbookViewState();
}

class _BookmarkEbookViewState extends State<BookmarkEbookView> {
  var randomNum = Random();

  late int hexCode = randomNum.nextInt(_list.colorCode.length);

  final MyList _list = MyList();

  bool onSave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3 * 1.3,
            width: double.infinity,
            child: Stack(
              children: [
                CurveLinePaint(colorCode: _list.colorCode[hexCode]),
                Positioned(
                  top: 30,
                  left: 15,
                  right: 15,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kSecondaryColor,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                onSave = !onSave;
                              });
                              if (onSave) {
                                print("removed");
                                EbookFunctions.removeBookmarkList({
                                  "id": BookmarkEbookView._function.ebook[0].id,
                                  "name":
                                      BookmarkEbookView._function.ebook[0].name,
                                  "url":
                                      BookmarkEbookView._function.ebook[0].url,
                                  "author": BookmarkEbookView
                                      ._function.ebook[0].author,
                                  "cover": BookmarkEbookView
                                      ._function.ebook[0].cover,
                                  "pages": BookmarkEbookView
                                      ._function.ebook[0].pages,
                                  "rating": BookmarkEbookView
                                      ._function.ebook[0].rating,
                                  "published": BookmarkEbookView
                                      ._function.ebook[0].published,
                                  "synopsis": BookmarkEbookView
                                      ._function.ebook[0].synopsis,
                                });
                                BookmarkEbookView._flushbar.showError(context,
                                    title: "Removed from Bookmark",
                                    message:
                                        "you have removed ${BookmarkEbookView._function.ebook[0].name} from your book mark");
                              } else {
                                print("saved");
                                EbookFunctions.addBookmarkList({
                                  "id": BookmarkEbookView._function.ebook[0].id,
                                  "name":
                                      BookmarkEbookView._function.ebook[0].name,
                                  "url":
                                      BookmarkEbookView._function.ebook[0].url,
                                  "author": BookmarkEbookView
                                      ._function.ebook[0].author,
                                  "cover": BookmarkEbookView
                                      ._function.ebook[0].cover,
                                  "pages": BookmarkEbookView
                                      ._function.ebook[0].pages,
                                  "rating": BookmarkEbookView
                                      ._function.ebook[0].rating,
                                  "published": BookmarkEbookView
                                      ._function.ebook[0].published,
                                  "synopsis": BookmarkEbookView
                                      ._function.ebook[0].synopsis,
                                });
                                BookmarkEbookView._flushbar.showSuccessful(
                                    context,
                                    title: "Added to Bookmark",
                                    message:
                                        "you have successfully added ${BookmarkEbookView._function.ebook[0].name} to your book mark");
                              }
                            },
                            icon: onSave
                                ? Icon(
                                    EBookIcon.bookmark_outline,
                                    color: kPrimaryColor,
                                  )
                                : Icon(
                                    EBookIcon.bookmark,
                                    color: kPrimaryColor,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TweenAnimationBuilder(
                  builder: (BuildContext context, double value, Widget? child) {
                    return Opacity(
                        opacity: value,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: value * 100, left: 125, right: 125),
                          child: child,
                        ));
                  },
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.cover,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: AppText.heading3SB(
                widget.title,
                color: Colors.white,
                multitext: true,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppText.heading5M(
              "by ${widget.author}",
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookmarkEbookView._function.getStarRating(
                        size: 25, rating: double.parse(widget.rating)),
                    const SizedBox(height: 4),
                    AppText.captionSB(
                      widget.rating,
                      color: Colors.white,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText.heading6M(
                          "pages:",
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        AppText.captionSB(
                          widget.pages,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    AppText.heading6M(
                      "published:",
                      color: Colors.white,
                    ),
                    const SizedBox(height: 4),
                    AppText.captionSB(
                      widget.published,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: AppText.heading5M(
              "Synopsis:",
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: AppText.textFieldR(
              widget.synopsis,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebViewApp(url: widget.url))),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: AppText.textFieldR(
                    "Read more ...",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
