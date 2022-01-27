import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/bag_widgets/payable_item.dart';

class PayablesList extends StatelessWidget {
  const PayablesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payable',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            PayableItem(
              title: 'Product Total',
              subTitle: 'Rs 200',
            ),
            PayableItem(
              title: 'Delivery Charge',
              subTitle: 'Rs 25',
            ),
            PayableItem(
              title: 'Total Payable',
              subTitle: 'Rs 225',
              bold: true,
            ),
          ],
        ),
      ],
    );
  }
}
