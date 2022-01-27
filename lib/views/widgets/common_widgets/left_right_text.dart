import 'package:flutter/material.dart';
import 'package:gopasal/utils/app_colors.dart';

class LeftRightText extends StatelessWidget {
  final String? leftText;
  final String? rightText;
  final Function()? onPressed;

  const LeftRightText({
    Key? key,
    this.leftText,
    this.rightText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leftText != null)
            Text(
              '$leftText',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (rightText != null)
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                primary: kColorGrey2,
              ),
              child: Text(
                '$rightText',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
