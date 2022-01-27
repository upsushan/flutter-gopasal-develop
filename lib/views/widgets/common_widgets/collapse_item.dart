import 'package:flutter/material.dart';
import 'package:gopasal/utils/app_colors.dart';

class CollapseItem extends StatefulWidget {
  final String title;
  final String description;

  const CollapseItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<CollapseItem> createState() => _CollapseItemState();
}

class _CollapseItemState extends State<CollapseItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 0.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0,
                  color: kColorGrey,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: kColorGrey,
              )
            ],
          ),
        ),
      ],
    );
  }
}
