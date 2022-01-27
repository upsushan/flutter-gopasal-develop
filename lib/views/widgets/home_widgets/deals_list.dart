import 'package:flutter/material.dart';
import 'package:gopasal/models/product_model.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/home_widgets/deal_item.dart';

class DealsList extends StatelessWidget {
  final List<Product> products;
  const DealsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [Color(0xffB9CEA9), Color(0xffF8F8F8),Color(0xffF8F8F8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        child: Column(
          children: [
            _headerBuilder(),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 165.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final _widget = DealItem(
                    product: products[index],
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
          ],
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Deals of the Day',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(0xff595959),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: kColorLightGreen,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: kColorDarkGreen,
                  size: 17.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  '20:27:12',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kColorDarkGreen,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
