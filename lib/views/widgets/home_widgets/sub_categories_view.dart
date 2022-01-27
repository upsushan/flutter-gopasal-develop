import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopasal/models/category_model.dart';
import 'package:gopasal/test_data.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/home_widgets/categories_list.dart';
import 'package:gopasal/views/widgets/home_widgets/home_navbar.dart';
import 'package:gopasal/views/widgets/home_widgets/products_list.dart';

class SubCategoriesView extends StatefulWidget {
  final Function(Category)? onPressedCategory;
  const SubCategoriesView({
    Key? key,
    this.onPressedCategory,
  }) : super(key: key);

  @override
  State<SubCategoriesView> createState() => _SubCategoriesViewState();
}

class _SubCategoriesViewState extends State<SubCategoriesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  int _activeTab = 0;
  bool _showSearchBar = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();

    _tabController.addListener(() {
      setState(() => _activeTab = _tabController.index);
    });
    _scrollController.addListener(() {
      setState(
        () => _showSearchBar = _scrollController.position.pixels >= 56.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppbar(
          requiredSearchBar: _showSearchBar,
          requiredSearchButton: !_showSearchBar,
        ),
        SizedBox(
          height: _showSearchBar ? 2.0 : 12.0,
        ),
        Expanded(
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [_headerBuilder()];
            },
            body: _subCategoriesTabViewBuilder(),
          ),
        ),
      ],
    );
  }

  Widget _headerBuilder() {
    return SliverAppBar(
      expandedHeight: 93.0,
      backgroundColor: kcBgColor,
      elevation: 0.0,
      pinned: true,
      toolbarHeight: 45,
      leading: Container(),
      leadingWidth: 0.0,
      titleSpacing: 0.0,

      titleTextStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),


      title: CategoriesList(
        categories: testCategories,
        onCategorySelect: widget.onPressedCategory,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: _subCategoriesTabBarBuilder(),
      ),
    );
  }

  Widget _subCategoriesTabBarBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        height: 33.0,
        child: TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabs: [
            _tabItemBuilder(
              0,
              'All Fruits',
            ),
            _tabItemBuilder(
              1,
              'Citrus Fruits',
              borderWidth: 74.0,
            ),
            _tabItemBuilder(
              2,
              'Ripe Fruits',
              borderWidth: 70.0,
            ),
            _tabItemBuilder(
              3,
              'Unripe Fruits',
              borderWidth: 80.0,
            ),
            _tabItemBuilder(
              4,
              'Fresh Fruits',
              borderWidth: 78.0,
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _subCategoriesTabViewBuilder() {
    return TabBarView(
      controller: _tabController,
      children: [
        ProductsList.vertical(
          products: testProducts,
          scroll: true,
        ),
        ProductsList.vertical(
          products: testProducts,
          scroll: true,
        ),
        ProductsList.vertical(
          products: testProducts,
          scroll: true,
        ),
        ProductsList.vertical(
          products: testProducts,
          scroll: true,
        ),
        ProductsList.vertical(
          products: testProducts,
          scroll: true,
        ),
      ],
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
}
