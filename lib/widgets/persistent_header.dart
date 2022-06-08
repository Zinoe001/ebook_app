
import 'package:flutter/cupertino.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate{

const PersistentHeader({Key? key,required this.child}) : super();

final Widget child;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0XFF1A2232),
      child: child
    );
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}