import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/bag_widgets/bags_list.dart';
import 'package:gopasal/views/widgets/bag_widgets/checkout_bottomsheet.dart';
import 'package:gopasal/views/widgets/common_widgets/appbar.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: Column(
        children: [
          CommonAppbar(
            title: 'My Bag',
            subTitle: '2 items',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BagsList(),
            ),
          ),
          CheckoutBottomSheet(),
        ],
      ),
    );
  }
}
