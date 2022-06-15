import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/custom_icons.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    Key? key,
    required this.length,
    required this.halfLength, required this.size,
  }) : super(key: key);
  final int length;
  final int halfLength;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ...List.generate(
            length,
            (index) => Icon(
              EBookIcon.star,
              color: kPrimaryColor,
              size: size,
            ),
          ),
          ...List.generate(
            halfLength,
            (index) => Icon(
              EBookIcon.star_half,
              color: kPrimaryColor,
              size: size,
            ),
          ),
          ...List.generate(
            5-length-halfLength,
            (index) => Icon(
              EBookIcon.star_outlined,
              color: kPrimaryColor,
              size: size,
            ),
          ),
        ]);
  }
}
