import 'package:ebook_app/core/utils/text.dart';
import 'package:flutter/material.dart';


class Tabs extends StatelessWidget {
  const  Tabs({
    Key? key,required this.color, required this.title,
  }) : super(key: key);
 final Color color; 
final String title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 55,
                width: 125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color),
                child: Center(
                    child: AppText.textFieldSB(
                  title,
                  color: Colors.white,
                )),
              ),
            );
  }
}
