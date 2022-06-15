import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/views/search/components/search_list_view.dart';
import 'package:ebook_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kPrimaryColor),
                      child: Icon(
                        Icons.arrow_back,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _textController,
                onSubmitted: (value) {
                  value = _textController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchListView(
                                query: _textController.text,
                              )));
                },
              ),
              const SizedBox(height: 64),
              FadeTransition(
                opacity: _controller,
                child: Lottie.asset("assets/lottieFiles/book_search.json",
                    height: 375),
              )
            ],
          ),
        ),
      ),
    );
  }
}
