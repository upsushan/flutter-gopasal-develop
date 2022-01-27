import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gopasal/utils/app_colors.dart';

class PricePointItem extends StatelessWidget {
  const PricePointItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: kColorGreen,
          ),
        ),
        padding: const EdgeInsets.all(2.0),
        child: Container(
        width: 80.0,
    height: 80.0,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
    image: AssetImage('assets/images/flat199_nep.png'),
    fit: BoxFit.contain,
    ),
    ),
      ),
    ),
    );
  }
}
