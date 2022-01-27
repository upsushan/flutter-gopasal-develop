import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/screens/home/brands_screen.dart';

class QuantitySelectorDialog extends StatelessWidget {
  const QuantitySelectorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // Image.asset(
              //   'assets/images/prod_jam.png',
              //   height: 75.0,
              // ),


              Container(
                  height: 78,
                  width: 78,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image:AssetImage('assets/images/prod_jam.png'),
                      )
                  ),
                  alignment: Alignment.bottomCenter, // This aligns the child of the container
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 3), //some spacing to the child from bottom
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: kColorYellow,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.5, horizontal: 5.0),
                      child: Text(
                        '-12%',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.karla().fontFamily,
                        ),
                      ),
                    ),
                  )
              ),

              SizedBox(
                width: 2.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dabur Chyawanprash',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  Row(

                    children: [

                      Text(
                        'Rs 85',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: kColorGreen,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Rs 96',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: kColorGrey3,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Per Each',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: kColorGrey3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  Text(
                    '500 grams',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kColorGrey3,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),

                ],
              ),
            ],
          ),
          Divider(),
          _quantityListBuilder(context),
        ],
      ),
    );
  }



  Widget _seeAllProductsBtnBuilder(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BrandScreen(),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height:   30,
        decoration: BoxDecoration(
          color: kColorGrey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/dabur_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'See All Dabur Products',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
          ],
        ),
      ),
    );
  }


  Widget _quantityListBuilder(final BuildContext context) {
    return Column(
      children: [
        _quantityItemBuilder(context: context, title: '1 Packet (Rs. 25)'),
        _quantityItemBuilder(context: context, title: '2 Packet (Rs 50)'),
        _quantityItemBuilder(
          context: context,
          title: '3 Packet (Rs. 70)',
          subTitle: 'Rs. 5 off',
        ),
        _quantityItemBuilder(
          context: context,
          title: '4 Packet (Rs. 90)',
          subTitle: 'Rs. 10 off',
        ),
      ],
    );
  }

  Widget _quantityItemBuilder({
    required final BuildContext context,
    required final String title,
    final String? subTitle,
  }) {
    return ListTile(
      onTap: () => Navigator.of(context).pop(),
      dense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal:
      15.0),
      title: Row(

        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 14.0,
          ),
          Icon(
            Icons.circle,
            size: 12.0,
            color: kColorGrey5,
          ),
          SizedBox(
            width: 38.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          if (subTitle != null)
            SizedBox(
              width: 10.0,
            ),
          if (subTitle != null)
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: kColorGreen,
                fontSize: 12.0,
              ),
            ),
        ],
      ),
    );
  }
}
