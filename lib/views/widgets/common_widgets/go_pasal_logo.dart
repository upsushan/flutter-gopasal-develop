import 'package:flutter/material.dart';

class GOPasalLogo extends StatelessWidget {
  final double? size;
  const GOPasalLogo({
    Key? key,
    this.size = 220.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/banner.png',
      width: size,
      height: size,
    );
  }
}
