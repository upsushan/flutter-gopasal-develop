import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/brand_widgets/popular_brand_product_item.dart';

class PopularBrandProductsList extends StatelessWidget {
  final List<Product> products;
  const PopularBrandProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 210.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: kColorGreen2.withOpacity(0.32),
        ),
        child: Column(
          children: [
            _titleBuilder(),
            _productsListBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _titleBuilder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: kColorLightGreen.withOpacity(0.18),
      ),
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
          ),
          SvgPicture.asset('assets/svgs/popular.svg'),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Dabur’s Most Popular this Week',
            style: TextStyle(
              fontSize: 12.0,
              color: kColorDarkGreen,
            ),
          )
        ],
      ),
    );
  }

  Widget _productsListBuilder() {
    return SizedBox(
      height: 170.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final _widget = PopularBrandProductItem(
            product: products[index],
          );

          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 5),
              child: _widget,
            );
          }
          return _widget;
        },
      ),
    );
  }
}
