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
import 'package:lottie/lottie.dart';

class EbookView extends StatefulWidget {
  const EbookView(
      {Key? key, required this.id, required this.cover, required this.title})
      : super(key: key);
  final int id;
  final String cover;
  final String title;
  @override
  State<EbookView> createState() => _EbookViewState();
}

class _EbookViewState extends State<EbookView>
    with SingleTickerProviderStateMixin {
  var randomNum = Random();
  late int hexCode = randomNum.nextInt(_list.colorCode.length);
  final MyList _list = MyList();
  static final EbookFunctions _function = EbookFunctions();
  static final EbookFlushbar _flushbar = EbookFlushbar();
  late AnimationController _controller;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getEbook(id: widget.id));
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    super.initState();
    _controller.forward();
  }

  getEbook({required int id}) async {
    await _function.getEbook(id: id);
    setState(() {
      _function.ebook;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool onSave = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: _function.ebook.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _controller,
                  child: Lottie.asset(
                    "assets/lottieFiles/loading.json",
                  ),
                )
              ],
            )
          : ListView(
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
                              onPressed: () {
                                _function.ebook.clear();
                                Navigator.pop(context);
                              },
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
                                      print("saved");
                                      EbookFunctions.addBookmarkList({
                                        "id": _function.ebook[0].id,
                                        "name": _function.ebook[0].name,
                                        "url": _function.ebook[0].url,
                                        "author": _function.ebook[0].author,
                                        "cover": _function.ebook[0].cover,
                                        "pages": _function.ebook[0].pages,
                                        "rating": _function.ebook[0].rating,
                                        "published":
                                            _function.ebook[0].published,
                                        "synopsis": _function.ebook[0].synopsis,
                                      });
                                      _flushbar.showSuccessful(context,
                                          title: "Added to Bookmark",
                                          message:
                                              "you have successfully added ${_function.ebook[0].name} to your book mark");
                                    } else {
                                      print("removed");
                                      EbookFunctions.removeBookmarkList({
                                        "id": _function.ebook[0].id,
                                        "name": _function.ebook[0].name,
                                        "url": _function.ebook[0].url,
                                        "author": _function.ebook[0].author,
                                        "cover": _function.ebook[0].cover,
                                        "pages": _function.ebook[0].pages,
                                        "rating": _function.ebook[0].rating,
                                        "published":
                                            _function.ebook[0].published,
                                        "synopsis": _function.ebook[0].synopsis,
                                      });
                                      _flushbar.showError(context,
                                          title: "Removed from Bookmark",
                                          message:
                                              "you have removed ${_function.ebook[0].name} from your book mark");
                                    }
                                  },
                                  icon: onSave
                                      ? Icon(
                                          EBookIcon.bookmark,
                                          color: kPrimaryColor,
                                        )
                                      : Icon(
                                          EBookIcon.bookmark_outline,
                                          color: kPrimaryColor,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TweenAnimationBuilder(
                        builder: (BuildContext context, double value,
                            Widget? child) {
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
                    "by ${_function.ebook[0].author[0]}",
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
                          _function.getStarRating(
                              size: 25,
                              rating: double.parse(_function.ebook[0].rating)),
                          const SizedBox(height: 4),
                          AppText.captionSB(
                            "${_function.ebook[0].rating} rating",
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
                                _function.ebook[0].pages,
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
                            _function.ebook[0].published,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: AppText.heading5M(
                    "Synopsis:",
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: AppText.textFieldR(
                    _function.ebook[0].synopsis,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebViewApp(url: _function.ebook[0].url))),
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
