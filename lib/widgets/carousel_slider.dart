import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/views/ebook/components/ebook_card.dart';
import 'package:ebook_app/views/ebook/ebook_view.dart';
import 'package:flutter/material.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  static final EbookFunctions _function = EbookFunctions();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getEbooks());
    super.initState();
  }

  getEbooks() async {
    await _function.getEbookList();
    setState(() {
      _function.ebookList;
    });
  }

  // This is the starting index of carousel images in a list
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _function.ebookList.isEmpty
        ? const EbookCardSkelenton()
        : CarouselSlider(
            options: CarouselOptions(
                height: 200,
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.4,
                autoPlayCurve: Curves.easeInToLinear,
                autoPlayAnimationDuration: const Duration(milliseconds: 900)),
            items: _function.ebookList.map((e) {
              /// A custom widget that shows the news topic,image and published time
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EbookView(
                              id: int.parse(e.id),
                              cover: e.cover,
                              title: e.name,
                            ))),
                child: EbookCard(
                  cover: e.cover,
                ),
              );
            }).toList(),
          );
  }
}
