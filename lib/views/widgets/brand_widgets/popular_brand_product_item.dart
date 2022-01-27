import 'package:flutter/material.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularBrandProductItem extends StatelessWidget {
  final Product product;
  const PopularBrandProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5,
        top: 15.0,
      ),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal:6.0),
              child: Row(
                  children: [
                    _imgBuilder()
                  ])
          ),
          _svgAward(),
          SizedBox(
            height: 5.0,
          ),
          _productDetailsBuilder(),
        ],
      ),
    );
  }

  Widget _imgBuilder() {
    return Image.asset(
      product.imgUrl ?? '',
      width: 65.0,
      height: 65.0,
    );
  }

  Widget _svgAward(){
    return SvgPicture.asset('assets/svgs/awardmain.svg',height: 21.5);
  }

  Widget _productDetailsBuilder() {
    final _name = (product.name?.length ?? 0) < 15.0
        ? product.name
        : (product.name?.substring(0, 15) ?? '') + '...';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$_name',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10.0,
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Rs ${product.price} ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
                color: kColorGreen,
              ),
            ),
            Text(
              '500 grams',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 9.0,
                color: kColorGrey2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
