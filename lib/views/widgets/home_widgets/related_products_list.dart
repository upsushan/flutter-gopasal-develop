import 'package:always_scroll_list/always_scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/views/widgets/home_widgets/related_product_list_item.dart';

class RelatedProductsList extends StatelessWidget {
  final List<Product> products;
  final bool autoScroll;
  const RelatedProductsList({
    Key? key,
    required this.products,
    this.autoScroll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {},
      child: SizedBox(
        height: 100.0,
        child: AlwaysScrollList.horizontal(
          items: products,
          enabled: autoScroll,
          itemBuilder: (context, index, item) {
            final _widget = RelatedProductItem(
              product: item,
            );

            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: _widget,
              );
            }
            return _widget;
          },
        ),
      ),
    );
  }
}
