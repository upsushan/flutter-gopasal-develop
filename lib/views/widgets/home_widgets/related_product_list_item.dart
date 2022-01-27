import 'package:flutter/material.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/utils/app_colors.dart';

class RelatedProductItem extends StatelessWidget {
  final Product product;
  const RelatedProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
      child: Container(
        width: 155.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: kColorGrey3,
              offset: Offset(1.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            _imgBuilder(),
            SizedBox(
              width: 5.0,
            ),
            Expanded(child: _productDetailsBuilder()),
          ],
        ),
      ),
    );
  }

  Widget _imgBuilder() {
    return Image.asset(
      product.imgUrl ?? '',
      width: 55.0,
      height: 55.0,
    );
  }

  Widget _productDetailsBuilder() {
    final _name = product.name;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          '$_name',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10.0,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Text(
              'Rs ${product.price}5',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
                color: kColorGreen,
              ),
            ),
            SizedBox(
              width: 2.0,
            ),
            Text(
              'Per Each',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 9.0,
                color: kColorGrey2,
              ),
            ),
          ],
        ),
        Text(
          '500 grams',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10.0,
            color: kColorGrey2,
          ),
        ),
      ],
    );
  }
}
