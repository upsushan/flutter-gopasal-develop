import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopasal/models/category_model.dart';
import 'package:gopasal/test_data.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/screens/home/search_screen.dart';
import 'package:gopasal/views/widgets/common_widgets/search_bar.dart';
import 'package:gopasal/views/widgets/home_widgets/brand_products.dart';
import 'package:gopasal/views/widgets/home_widgets/categories_list.dart';
import 'package:gopasal/views/widgets/home_widgets/deals_list.dart';
import 'package:gopasal/views/widgets/home_widgets/home_navbar.dart';
import 'package:gopasal/views/widgets/home_widgets/hyper_deal.dart';
import 'package:gopasal/views/widgets/home_widgets/price_points_list.dart';
import 'package:gopasal/views/widgets/home_widgets/products_list.dart';
import 'package:gopasal/views/widgets/home_widgets/wishes_list.dart';

class HomeView extends StatelessWidget {
  final Function(Category)? onPressedCategory;
  const HomeView({
    Key? key,
    this.onPressedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppbar(
          requiredSearchButton: false,
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [_headerBuilder(context)];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  HyperDeal(),
                  SizedBox(
                    height: 20.0,
                  ),
                  BrandProducts(),
                  SizedBox(
                    height: 20.0,
                  ),
                  PricePointsList(),
                  SizedBox(
                    height: 20.0,
                  ),
                  DealsList(
                    products: testProducts,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ProductsList.horizontal(
                    title: 'Vegetables',
                    products: testProducts,
                  ),
                  WishesList(
                    wishes: testWishes,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ProductsList.vertical(
                    title: 'Fruits',
                    products: testProducts,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ProductsList.vertical(
                    title: 'Browse All Products',
                    products: testProducts,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _headerBuilder(final BuildContext context) {
    return SliverAppBar(
      expandedHeight: 118.0,
      backgroundColor: kcBgColor,
      elevation: 0.0,
      pinned: true,
      leading: Container(),
      leadingWidth: 0.0,
      titleSpacing: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: CategoriesList(
          categories: testCategories,
          onCategorySelect: onPressedCategory,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SearchBar(
            hintText: 'Search Broccoli, Apple, Badam, etc ',
            enabled: false,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchScreen(),
                ),
              );
            },
          ),
        ),
      ),
      // flexibleSpace: FlexibleSpaceBar(
      //   centerTitle: true,
      //   title: Padding(
      //     padding: const EdgeInsets.only(bottom: 2.0),
      //     child: CategoriesList(
      //       categories: testCategories,
      //       onCategorySelect: onPressedCategory,
      //     ),
      //   ),
      // ),
    );
  }
}
