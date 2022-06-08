import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/custom_icons.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:ebook_app/views/home/components/ebook_show_case.dart';
import 'package:ebook_app/widgets/carousel_slider.dart';
import 'package:ebook_app/widgets/persistent_header.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1A2232),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    AppText.heading1SB(
                      "Let's Discover",
                      color: Colors.white,
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          EBookIcon.search,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 25)),
              SliverPersistentHeader(
                pinned: false,
                delegate: PersistentHeader(
                  child: AppText.heading4M(
                    "Explore",
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: CarouselView()),
              const EbookShowCase(),
            ],
          ),
        ),
      ),
    );
  }
}
