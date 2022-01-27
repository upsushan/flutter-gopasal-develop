import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/bag_widgets/addresses_list.dart';
import 'package:gopasal/views/widgets/bag_widgets/delivery_options_list.dart';
import 'package:gopasal/views/widgets/bag_widgets/payables_list.dart';
import 'package:gopasal/views/widgets/common_widgets/input.dart';

class CheckoutBottomSheet extends StatefulWidget {
  const CheckoutBottomSheet({Key? key}) : super(key: key);

  @override
  State<CheckoutBottomSheet> createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  void _openBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => _BottomSheetBuilder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: _continueBuilder(),
    );
  }

  Widget _continueBuilder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Product Total',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            Text(
              'Rs 200',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        FoodWithLoveButton.filled(
          value: 'Continue',
          onPressed: _openBottomSheet,
          borderRadius: 50.0,
          color: kColorGreen,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _BottomSheetBuilder extends StatefulWidget {
  const _BottomSheetBuilder({Key? key}) : super(key: key);

  @override
  _BottomSheetBuilderState createState() => _BottomSheetBuilderState();
}

class _BottomSheetBuilderState extends State<_BottomSheetBuilder> {
  int _step = 1;

  @override
  Widget build(BuildContext context) {
    final _widgets = <Widget>[
      _selectAddressBuilder(),
      _addAddressBuilder(),
      _deliveryBuilder(),
      _selectGpsBuilder(),
    ];

    return SizedBox(
      height: 500.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: _widgets[_step - 1],
      ),
    );
  }

  // STEP 1 : Select Existing Address
  Widget _selectAddressBuilder() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Address',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              FoodWithLoveButton.filled(
                value: 'Add New',
                color: kColorGreen,
                onPressed: () {
                  setState(() => _step = 2);
                },
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                padding: const EdgeInsets.all(2.0),
                borderRadius: 10.0,
              )
            ],
          ),
        ),
        Expanded(child: SingleChildScrollView(child: AddressesList())),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FoodWithLoveButton.filled(
            value: 'Select Address',
            onPressed: () => setState(() => _step = 3),
            borderRadius: 50.0,
            color: kColorGreen,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // STEP 2 : Add New Address
  Widget _addAddressBuilder() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Add New Address',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(child: _addAddressInputContainer()),
            SizedBox(
              height: 20.0,
            ),
            FoodWithLoveButton.filled(
              value: 'Save Address',
              onPressed: () => setState(() => _step = 1),
              borderRadius: 50.0,
              color: kColorGreen,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // STEP 3 : Delivery Options
  Widget _deliveryBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Select Delivery Timings',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              DeliveryOptionsList(),
              SizedBox(
                height: 30.0,
              ),
              PayablesList(),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveButton.filled(
            value: 'Order Now',
            onPressed: () {},
            borderRadius: 50.0,
            color: kColorGreen,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // STEP 4 : Select GPS
  Widget _selectGpsBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Change Location',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: kColorGrey5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                _gpsBuilder(fromChangeLocation: true),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveButton.filled(
            value: 'Save Changes',
            onPressed: () => setState(() => _step = 2),
            borderRadius: 50.0,
            color: kColorGreen,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addAddressInputContainer() {
    return Column(
      children: [
        TextInput(
          hintText: 'Full Name',
          leftIcon: SvgPicture.asset(
            'assets/svgs/full_name.svg',
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextInput(
          hintText: 'Mobile Number',
          leftIcon: SvgPicture.asset(
            'assets/svgs/mobile_number.svg',
          ),
          type: TextInputType.number,
        ),
        SizedBox(
          height: 15.0,
        ),
        TextInput(
          hintText: 'Optional Mobile Number',
          leftIcon: SvgPicture.asset(
            'assets/svgs/mobile_number.svg',
          ),
          type: TextInputType.number,
        ),
        SizedBox(
          height: 15.0,
        ),
        TextInput(
          hintText: 'Address',
          leftIcon: SvgPicture.asset(
            'assets/svgs/address.svg',
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        _gpsBuilder(),
      ],
    );
  }

  Widget _gpsBuilder({
    final bool fromChangeLocation = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: fromChangeLocation ? null : () => setState(() => _step = 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: fromChangeLocation
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )
              : BorderRadius.circular(20.0),
          color: kColorGrey5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: fromChangeLocation ? 15.0 : 11.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1.0,
            ),
            SvgPicture.asset(
              'assets/svgs/gps.svg',
              height: 24.0,
            ),
            SizedBox(
              width: 11.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GPS',
                  style: TextStyle(
                    color: kColorDarkGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  'Unnamed Road, Street 4, Anarmani',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Text(
                      "4.5 Km's ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kColorGreen,
                      ),
                    ),
                    Text(
                      'from Mukti Chowk',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (!fromChangeLocation)
                  SizedBox(
                    height: 3.0,
                  ),
                if (!fromChangeLocation)
                  Text(
                    'Click to Change Location',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kColorGrey,
                      fontSize: 12.0,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
