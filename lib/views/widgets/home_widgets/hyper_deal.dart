import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gopasal/helpers/dialog_provider.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/common_widgets/quantity_selector_dialog.dart';
import 'package:shimmer/shimmer.dart';

class HyperDeal extends StatefulWidget {
  const HyperDeal({Key? key}) : super(key: key);

  @override
  State<HyperDeal> createState() => _HyperDealState();
}

class _HyperDealState extends State<HyperDeal> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _hyperDealHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 12.0,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/prod_nescafe.png',
                    width: 90.0,
                    height: 90.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today Only    25 Grams',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kColorGrey2,
                          fontSize: 11.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Netscafe Coffee Classic',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      _priceBuilder(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hyperDealHeader() {
    return Container(

         decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFF2F61),
            Color(0xffC5115C),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 14.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                   child:SvgPicture.asset('assets/svgs/shock.svg'),
                ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            'HyperDeal',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          ],
        ),

        ],
      ),
        );
  }

  Widget _priceBuilder() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: kColorGreen, width: 1.5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            children: [
              Text(
                'Rs 125',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kColorGrey2,
                  fontSize: 12.0,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                'Rs. 1',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kColorGreen,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                width: 27.0,
              ),
            ],
          ),
        ),
        Positioned(
          right: -24.0,
          child: _addBtnBuilder(),
        ),
      ],
    );
  }

  Widget _addBtnBuilder() {
    return GestureDetector(
      onTap: () async {
        await DialogProvider(context).showNormalDialog(
          widget: QuantitySelectorDialog(),
        );
        setState(() => _added = true);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: _added ? kColorGreen : kColorGrey3,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Icon(
          _added ? Icons.check : Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
