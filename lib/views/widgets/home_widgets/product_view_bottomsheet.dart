import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gopasal/helpers/dialog_provider.dart';
import 'package:gopasal/test_data.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/screens/home/brands_screen.dart';
import 'package:gopasal/views/widgets/common_widgets/collapse_item.dart';
import 'package:gopasal/views/widgets/common_widgets/quantity_selector_dialog.dart';
import 'package:gopasal/views/widgets/home_widgets/related_products_list.dart';

class ProductViewBottomSheet extends StatefulWidget {
  const ProductViewBottomSheet({Key? key}) : super(key: key);
  @override
  State<ProductViewBottomSheet> createState() => _ProductViewBottomSheetState();
}

class _ProductViewBottomSheetState extends State<ProductViewBottomSheet> {
  bool _added = false;
  final _imgs = [
    'assets/images/prod_jam.png',
    'assets/images/prod_shampoo.png',
    'assets/images/prod_jam.png',
  ];
  int _activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 651.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imgBuilder(),
          SizedBox(
            height: 20.0,
          ),
          _mainDetailsBuilder(),
          SizedBox(
            height: 3.0,
          ),
          _collapseBuilder(),
          Divider(),
          _relatedProductsBuilder(),
        ],
      ),
    );
  }

  Widget _imgBuilder() {
    return Column(
      children: [
        SizedBox(
          height: 16.0,
        ),
        CarouselSlider.builder(
          itemCount: _imgs.length,
          itemBuilder: (context, index, index2) {
            return Image.asset(
              _imgs[index],
            );
          },
          options: CarouselOptions(
            height: 260,
            onPageChanged: (val, reason) =>
                setState(() => _activeImageIndex = val),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        _imgIndicator(),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }

  Widget _imgIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _imgs.length; i++)
          Container(
            width: _activeImageIndex == i ? 25.0 : 6.0,
            margin: const EdgeInsets.only(right: 5.0),
            height: 6.0,
            decoration: BoxDecoration(
              color: kColorLightBlack.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20.0),
            ),
          )
      ],
    );
  }

  Widget _mainDetailsBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dabur Chyawanprash',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs 85',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: kColorYellow,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 3.0),
                        child: Text(
                          '-21%',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Per Each',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: kColorGrey3,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '500 grams',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kColorGrey3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _addBtnBuilder(),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          _seeAllProductsBtnBuilder(),
        ],
      ),
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
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: _added ? kColorGreen : kColorGrey3,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        child: Icon(
          _added ? Icons.check : Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _seeAllProductsBtnBuilder() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BrandScreen(),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height:   35,
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

  Widget _collapseBuilder() {
    return Column(
      children: [
        CollapseItem(
          title: 'Description',
          description:
          'Chyavanprash is a cooked mixture of sugar, honey, ghee, Indian gooseberry jam, sesame oil, berries and various herbs and spices. It is prepared as per the instructions suggested in Ayurvedic texts. Chyavanprash is widely sold and consumed in India as a dietary supplement',
        ),
        CollapseItem(
          title: 'Nutritional Info',
          description:
          'Chyawanprash (CP) is an Ayurvedic health supplement which is made up of a super-concentrated blend of nutrient-rich herbs and minerals. It is meant to restore drained reserves of life force (ojas) and to preserve strength, stamina, and vitality, while stalling the course of aging.',
        ),
      ],
    );
  }

  Widget _relatedProductsBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          child: Text(
            'Related Products',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
              color: kColorGrey,
            ),
          ),
        ),
        RelatedProductsList(
          products: testProducts,
        ),
      ],
    );
  }
}
