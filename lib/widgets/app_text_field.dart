import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/custom_icons.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, this.onSubmitted, required this.controller})
      : super(key: key);
  final Function(String)? onSubmitted;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kSecondaryColor.shade300),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmitted,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        decoration: const InputDecoration(
            prefixIcon: Icon(
              EBookIcon.search,
              color: Colors.white,
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
