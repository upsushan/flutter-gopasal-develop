import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopasal/utils/app_colors.dart';

class AddressItem extends StatelessWidget {
  final Function()? onPressed;
  final bool active;
  const AddressItem({
    Key? key,
    this.onPressed,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: active ? kColorGreen : kColorGrey4,
                  width: 2.0,
                ),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ramesh Pokhrel',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kColorGrey,
                    ),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    'Arjundhara Road, Birtamode Jhapa',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "4.5KM's ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kColorGreen,
                        ),
                      ),
                      Text(
                        'from Mukti Chowk',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kColorGrey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '9862680000, 9818000000',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  _buttonsBuilder(),
                ],
              ),
            ),
            if (active)
              Positioned(
                right: -42.0,
                top: 20.0,
                child: _selectedBanner(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _selectedBanner() {
    return Transform.rotate(
      angle: pi / 4,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        color: kColorGreen,
        width: 150.0,
        child: Center(
          child: Text(
            'Selected',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonsBuilder() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              Icon(
                Icons.edit_rounded,
                color: kColorGrey2,
                size: 15.0,
              ),
              SizedBox(
                width: 2.0,
              ),
              Text(
                'Edit',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                  color: kColorGrey2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              Icon(
                Icons.delete_outline_rounded,
                color: kColorGrey2,
                size: 15.0,
              ),
              SizedBox(
                width: 2.0,
              ),
              Text(
                'Delete',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                  color: kColorGrey2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
