import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/order_widgets/order_list_item.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return OrderItem();
      },
    );
  }
}
