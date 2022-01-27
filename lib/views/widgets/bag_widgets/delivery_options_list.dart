import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/bag_widgets/delivery_option_item.dart';

class DeliveryOptionsList extends StatefulWidget {
  const DeliveryOptionsList({Key? key}) : super(key: key);

  @override
  State<DeliveryOptionsList> createState() => _DeliveryOptionsListState();
}

class _DeliveryOptionsListState extends State<DeliveryOptionsList> {
  int _activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DeliveryOptionItem(
            title: '35 Minutes',
            subTitle: 'Rs 25',
            expressDelivery: true,
            onPressed: () => setState(() => _activeIndex = 0),
            active: _activeIndex == 0,
          ),
        ),
        SizedBox(
          width: 6.0,
        ),
        Expanded(
          child: DeliveryOptionItem(
            title: '3-4 hours',
            subTitle: 'Delivery Free',
            onPressed: () => setState(() => _activeIndex = 1),
            active: _activeIndex == 1,
          ),
        ),
        SizedBox(
          width: 6.0,
        ),
        Expanded(
          child: DeliveryOptionItem(
            title: 'Tomorrow',
            subTitle: 'Delivery Free',
            onPressed: () => setState(() => _activeIndex = 2),
            active: _activeIndex == 2,
          ),
        ),
      ],
    );
  }
}
