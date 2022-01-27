import 'package:flutter/material.dart';
import 'package:gopasal/models/wishes_model.dart';

class WishesItem extends StatelessWidget {
  final Wishes wishes;
  const WishesItem({
    Key? key,
    required this.wishes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: Container(
        width: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('${wishes.imgUrl}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
