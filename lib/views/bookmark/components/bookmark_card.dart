import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/functions.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:flutter/material.dart';

class BookMarkCard extends StatelessWidget {
  const BookMarkCard(
      {Key? key,
      required this.cover,
      required this.name,
      required this.rating,
      required this.author})
      : super(key: key);

  final String cover;
  final String name;
  final String rating;
  final String author;

  static final EbookFunctions _function = EbookFunctions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 125,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 125,
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: cover,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.heading6M(
                    name,
                    multitext: true,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _function.getStarRating(
                        rating: double.parse(rating),
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  AppText.textFieldM(
                    "by $author",
                    multitext: true,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Icon(Icons.delete,color: kPrimaryColor,),
          ],
        ),
      ),
    );
  }
}
