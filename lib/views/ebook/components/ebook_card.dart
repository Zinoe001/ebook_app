import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:flutter/material.dart';

class EbookCard extends StatelessWidget {
  const EbookCard(
      {Key? key,
      required this.bookName,
      // required this.author,
      required this.cover})
      : super(key: key);

  final String bookName;
  // final String author;
  final String cover;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: cover,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        AppText.heading5M(
          bookName,
          color: Colors.white,
        ),
      ],
    );
  }
}
