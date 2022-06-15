import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:ebook_app/views/body/body.dart';
import 'package:ebook_app/views/ebook/ebook_view.dart';
import 'package:ebook_app/views/home/home_view.dart';
import 'package:ebook_app/views/search/components/search_card.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({Key? key, required this.query}) : super(key: key);
  final String query;
  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView>
    with SingleTickerProviderStateMixin {
  static final EbookFunctions _function = EbookFunctions();
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2), () => getBook(query: widget.query));
    super.initState();
  }

  getBook({required String query}) async {
    await _function.getSearhedList(q: query);
    setState(() {
      _function.searchList;
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
            leading: InkWell(
              onTap: () {
                _function.searchList.clear();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              ),
            ),
            title: AppText.heading2SB(
              "Searched on ${widget.query}",
              color: kPrimaryColor,
            ),
          ),
          _function.searchList.isEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => SearchCardSkeleton(),
                    childCount: 6,
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EbookView(
                                id: int.parse(_function.searchList[index].id),
                                cover: _function.searchList[index].cover,
                                title: _function.searchList[index].name)),
                      ),
                      child: SearchCard(
                        author: _function.searchList[index].author[0],
                        cover: _function.searchList[index].cover,
                        rating: _function.searchList[index].rating,
                        name: _function.searchList[index].name,
                      ),
                    ),
                    childCount: _function.searchList.length,
                  ),
                )
        ],
      ),
    );
  }
}
