import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/custom_icons.dart';
import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:ebook_app/widgets/curve_line_paint.dart';
import 'package:ebook_app/widgets/my_list.dart';
import 'package:ebook_app/widgets/web_view.dart';
import 'package:flutter/material.dart';

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

class _EbookViewState extends State<EbookView> {
  var randomNum = Random();
  late int hexCode = randomNum.nextInt(_list.colorCode.length);
  final MyList _list = MyList();
  static final EbookFunctions _function = EbookFunctions();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getEbook(id: widget.id));
    super.initState();
  }

  getEbook({required int id}) async {
    await _function.getEbook(id: id);
    setState(() {
      _function.ebook;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1A2232),
      body: _function.ebook.isEmpty
          ? const Center(child: CircularProgressIndicator())
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
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                EBookIcon.bookmark_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 120,
                        right: 120,
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
                              builder: (context) => WebViewApp(url: _function.ebook[0].url))),
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
