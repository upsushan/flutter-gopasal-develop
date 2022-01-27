import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/bag_widgets/bag_list_item.dart';

class BagsList extends StatelessWidget {
  const BagsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return BagItem();
      },
    );
  }
}
