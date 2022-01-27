import 'package:flutter/material.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/views/widgets/common_widgets/left_right_text.dart';
import 'package:gopasal/views/widgets/home_widgets/product_item.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;
  final String? title;
  final Axis direction;
  final bool scroll;

  const ProductsList.horizontal({
    Key? key,
    required this.products,
    this.title,
  })  : direction = Axis.horizontal,
        scroll = false,
        super(key: key);

  const ProductsList.vertical({
    Key? key,
    required this.products,
    this.title,
    this.scroll = false,
  })  : direction = Axis.vertical,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          LeftRightText(
            leftText: '$title',
            rightText: 'See All',
            onPressed: () {},
          ),
        direction == Axis.vertical
            ? scroll
                ? Expanded(child: _verticalBuilder())
                : _verticalBuilder()
            : _horizontalBuilder(),
        if (!scroll)
          SizedBox(
            height: 20.0,
          ),
      ],
    );
  }

  Widget _verticalBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        itemCount: products.length,
        physics: scroll
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        shrinkWrap: !scroll,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 2 / 2.88,
        ),
        itemBuilder: (context, index) {

          final _product = products[index];


          return ProductItem(product: _product);
        },
      ),
    );
  }

  Widget _horizontalBuilder() {
    return SizedBox(
      height: 254.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final _product = products[index];

          final _widget = Padding(
            padding: const EdgeInsets.only(
              right: 0.0,
              top: 5.0,
              bottom: 5.0,
            ),
            child: ProductItem(product: _product),
          );

          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: _widget,
            );
          }

          return _widget;
        },
      ),
    );
  }
}
