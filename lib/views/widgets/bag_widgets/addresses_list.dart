import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/bag_widgets/address_item.dart';

class AddressesList extends StatefulWidget {
  const AddressesList({Key? key}) : super(key: key);

  @override
  State<AddressesList> createState() => _AddressesListState();
}

class _AddressesListState extends State<AddressesList> {
  int _activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return AddressItem(
          onPressed: () => setState(() => _activeIndex = index),
          active: _activeIndex == index,
        );
      },
    );
  }
}
