import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/utils/app_colors.dart';

class DealItem extends StatelessWidget {
  final Product product;
  const DealItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _imgBuilder(),
            _titleAndPriceBuilder(),
            _discountedPriceBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _imgBuilder() {
    return Image.asset('${product.imgUrl}',width: 80);
  }

  Widget _titleAndPriceBuilder() {
    return Column(
      children: [
        Text(
          '${product.name}',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Rs ${product.price}',
          style: TextStyle(
            color: kColorGrey3,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.lineThrough,
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }

  Widget _discountedPriceBuilder() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 20.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                  color: kColorGreen,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(6,0,0,0),
                    child: Text(
                      'Price',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.5,
                        letterSpacing: 0.8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 20.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  color: kColorLightYellow,
                ),
                child: Center(
                  child: Text(
                    'Rs ${product.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color:kColorMidBlack
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 35.8,
          height: 23,
          width: 17,
          child: SvgPicture.asset('assets/svgs/shock.svg'),
        ),
      ],
    );
  }
}
