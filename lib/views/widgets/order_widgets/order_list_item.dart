import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gopasal/enums/order_status_type.dart';
import 'package:gopasal/helpers/dialog_provider.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/order_widgets/order_progress.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            _dateBuilder(),
            SizedBox(
              height: 10.0,
            ),
            _priceBuilder(),
            SizedBox(
              height: 20.0,
            ),
            OrderProgress(
              status: OrderStatus.packed,
            ),
            SizedBox(
              height: 50.0,
            ),
            _actionButtonsBuilder(context),
          ],
        ),
      ),
    );
  }

  Widget _dateBuilder() {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 18.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              '1 hour ago',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            )
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          'Invoice No. 12115',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }

  Widget _priceBuilder() {
    return Row(
      children: [
        Text(
          'Rs 515',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: kColorGrey3,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: Text(
            '4 Items',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButtonsBuilder(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/close.svg',
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Cancel Order',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: kColorGrey,
              ),
            ),
          ],
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => DialogProvider(context).showNormalDialog(
            widget: _showInfoDialogContent(context),
          ),
          child: Row(
            children: [
              Text(
                'Order Details',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: kColorGrey,
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              SvgPicture.asset(
                'assets/svgs/order_details.svg',
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _showInfoDialogContent(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/order_details.svg',
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    '4 Items',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: kColorRed,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 2.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 1.0,
                      ),
                      Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _productItem(),
        _productItem(),
        _productItem(),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                  color: kColorGrey2,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Rs. 600',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _productItem() {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/prod_fulkopi.png',
                    height: 37.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fulkopi',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        'Rs. 150 Per Each',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.0,
                          color: kColorGrey2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                'One Kg',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
              ),
              Text(
                'Rs 150',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
