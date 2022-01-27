import 'package:flutter/material.dart';
import 'package:gopasal/models/wishes_model.dart';
import 'package:gopasal/views/widgets/common_widgets/left_right_text.dart';
import 'package:gopasal/views/widgets/home_widgets/wishes_item.dart';

class WishesList extends StatelessWidget {
  final List<Wishes> wishes;
  const WishesList({
    Key? key,
    required this.wishes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (wishes.isEmpty) return Container();
    return Column(
      children: [
        LeftRightText(
          leftText: 'Your Wishes',
          rightText: 'See All',
          onPressed: () {},
        ),
        SizedBox(
          height: 160.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: wishes.length,
            itemBuilder: (context, index) {
              final _widget = WishesItem(
                wishes: wishes[index],
              );

              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: _widget,
                );
              }
              return _widget;
            },
          ),
        ),
      ],
    );
  }
}
