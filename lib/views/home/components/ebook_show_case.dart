import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/views/ebook/components/grid_ebook_card.dart';
import 'package:ebook_app/views/ebook/ebook_view.dart';
import 'package:ebook_app/widgets/my_list.dart';
import 'package:ebook_app/widgets/persistent_header.dart';
import 'package:ebook_app/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class EbookShowCase extends StatefulWidget {
  const EbookShowCase({Key? key}) : super(key: key);

  @override
  State<EbookShowCase> createState() => _EbookShowCaseState();
}

class _EbookShowCaseState extends State<EbookShowCase> {
  static final EbookFunctions _function = EbookFunctions();
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 4), () => getGenre(query: "romance"));

    super.initState();
  }

  getGenre({required String query}) async {
    await _function.getGenreList(q: query);
    setState(() {
      _function.genreList;
    });
  }

  late int? _selected = 0;
  final MyList _list = MyList();
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverPersistentHeader(
          pinned: true,
          delegate: PersistentHeader(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _list.ebookList.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        _selected = index;
                        setState(() {});
                        getGenre(query: _list.ebookList[index]);
                      },
                      child: Tabs(
                        title: _list.ebookList[index],
                        color: _selected == index
                            ? kPrimaryColor
                            : Colors.transparent,
                      )),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _function.genreList.isEmpty
            ? SliverGrid.count(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.6,
                crossAxisCount: 3,
                children: [
                  ...List.generate(6, (index) => const GridEbookCardSkelenton())
                ],
              )
            : SliverGrid.count(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.6,
                crossAxisCount: 3,
                children: [
                  ...List.generate(
                      _function.genreList.length,
                      (index) => GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EbookView(
                                          id: _function.genreList[index].id,
                                          cover:
                                              _function.genreList[index].cover,
                                          title:
                                              _function.genreList[index].name,
                                        ))),
                            child: GridEbookCard(
                              title: _function.genreList[index].name,
                              cover: _function.genreList[index].cover,
                            ),
                          ))
                ],
              )
      ],
    );
  }
}
