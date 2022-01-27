import 'package:flutter/material.dart';
import 'package:gopasal/test_data.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/home_widgets/related_products_list.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            _imgBuilder(),
            SizedBox(
              height: 10.0,
            ),
            RelatedProductsList(
              products: testProducts,
              autoScroll: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _imgBuilder() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/brand.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: -12.0,
          child: Container(
            width: 62.0,
            height: 62.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: kColorGreen,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/dabur_logo.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
