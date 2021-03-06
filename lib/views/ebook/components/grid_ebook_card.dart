import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class GridEbookCard extends StatelessWidget {
  const GridEbookCard({Key? key, required this.cover, required this.title})
      : super(key: key);
  final String cover;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
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

class GridEbookCardSkelenton extends StatelessWidget {
  const GridEbookCardSkelenton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      height: 125,
    );
  }
}
