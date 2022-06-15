import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class EbookCard extends StatelessWidget {
  const EbookCard({Key? key, required this.cover}) : super(key: key);

  final String cover;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: CachedNetworkImage(
        imageUrl: cover,
        fit: BoxFit.cover,
      ),
    );
  }
}

class EbookCardSkelenton extends StatelessWidget {
  const EbookCardSkelenton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      height: 175,
      width: 125,
    );
  }
}
