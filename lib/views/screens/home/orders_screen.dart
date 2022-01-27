import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/common_widgets/appbar.dart';
import 'package:gopasal/views/widgets/order_widgets/orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: Column(
        children: [
          CommonAppbar(
            title: 'My Orders',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: OrdersList(),
            ),
          ),
        ],
      ),
    );
  }
}
