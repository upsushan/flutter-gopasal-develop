import 'package:flutter/material.dart';
import 'package:gopasal/test_data.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/brand_widgets/arc.dart';
import 'package:gopasal/views/widgets/brand_widgets/popular_brand_products_list.dart';
import 'package:gopasal/views/widgets/home_widgets/products_list.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  int _activeTab = 0;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();

    _tabController.addListener(() {
      setState(() {
        _activeTab = _tabController.index;
      });
    });
    _scrollController.addListener(() {
      setState(() {
        _opacity = (_scrollController.position.maxScrollExtent -
                _scrollController.position.pixels) /
            _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              backgroundColor: Theme.of(context).canvasColor,
              expandedHeight: 190.0,
              toolbarHeight: 60,
              pinned: true,
              leading: Opacity(
                opacity: 1 - _opacity,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  color: kColorGreen,
                  splashRadius: 20.0,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: _headerBuilder(),
              ),
              elevation: 0.1,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(35.0),
                child: _tabBarBuilder(),

              ),
            ),
          ],
          body: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              _tabViewBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Opacity(
          opacity: _opacity,
          child: Container(
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/brand.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: MyArc(),
        ),
        Positioned(
          bottom: 7.0,
          left: 0.0,
          right: 0.0,
          child: _bannerBuilder(),
        ),
        // Positioned(
        //   bottom: -32.0,
        //   left: 0.0,
        //   right: 0.0,
        //   child: _tabBarBuilder(),
        // ),
      ],
    );
  }

  Widget _tabBarBuilder() {
    return Container(
      // color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.only(bottom: 3.0),
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.transparent,
        tabs: [
          _tabItemBuilder(
            0,
            'All Products',
            borderWidth: 80.0,
          ),
          _tabItemBuilder(
            1,
            'Health and Nutrition',
            borderWidth: 130.0,
          ),
          _tabItemBuilder(
            2,
            'Hair Oils',
            borderWidth: 60.0,
          ),
          _tabItemBuilder(
            3,
            'Toiletries',
            borderWidth: 60.0,
          ),
          _tabItemBuilder(
            4,
            'Fresh Fruits',
            borderWidth: 78.0,
          ),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget _tabItemBuilder(
    final int index,
    final String title, {
    final double? borderWidth = 60.0,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: _activeTab == index ? Colors.black : kColorGrey2,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: borderWidth,
          height: 2.0,
          decoration: BoxDecoration(
            color: _activeTab == index ? kColorGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ],
    );
  }

  Widget _tabViewBuilder() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                PopularBrandProductsList(
                  products: testProducts,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ProductsList.vertical(products: testProducts),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                PopularBrandProductsList(
                  products: testProducts,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ProductsList.vertical(products: testProducts),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                PopularBrandProductsList(
                  products: testProducts,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ProductsList.vertical(products: testProducts),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                PopularBrandProductsList(
                  products: testProducts,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ProductsList.vertical(products: testProducts),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                PopularBrandProductsList(
                  products: testProducts,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ProductsList.vertical(products: testProducts),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bannerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: kColorGrey.withOpacity(_opacity),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Theme.of(context).canvasColor,
              width: 2.0,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
          child: Row(
            children: [
              Container(
                width: 28.0,
                height: 28.0,
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
                'Dabur',
                style: TextStyle(
                  color: _opacity <= 0.5 ? kColorGrey : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
