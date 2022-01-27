import 'package:flutter/material.dart';
import 'package:gopasal/test_data.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/home_widgets/home_navbar.dart';
import 'package:gopasal/views/widgets/home_widgets/products_list.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppbar(
              title: _tagTitleBuilder(),
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: kColorGreen,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ProductsList.vertical(products: testProducts),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tagTitleBuilder() {
    return Container(
      decoration: BoxDecoration(
        color: kColorGrey4,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 8.0,
      ),
      child: Center(
        child: Text(
          'Tasty Chinese Apple',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
