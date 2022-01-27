import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/home_widgets/price_point_item.dart';

class PricePointsList extends StatelessWidget {
  const PricePointsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Price Points',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 75.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              final _widget = PricePointItem();

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
    );
  }
}
