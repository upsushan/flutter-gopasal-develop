import 'package:flutter/material.dart';
import 'package:gopasal/test_data.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/widgets/common_widgets/main_drawer.dart';
import 'package:gopasal/views/widgets/home_widgets/home_navbar.dart';
import 'package:gopasal/views/widgets/common_widgets/search_bar.dart';
import 'package:gopasal/views/widgets/home_widgets/products_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchHistoryItems = [
    'dettol',
    'harpic',
    'apple',
    'micros',
    'cream lotion',
    'perfume',
  ];

  final _searchSuggestionItems = [
    'Apple from Jumla',
    'Apple Indian',
    'Apple Fuzi',
    'Chinese Apple ',
    'Dallo Apple',
    'Syau',
  ];

  final TextEditingController _searchController = TextEditingController();
  bool _showingResults = false;
  bool _showingSuggestions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              HomeAppbar(
                requiredSearchButton: false,
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      SearchBar(
                        controller: _searchController,
                        autoFocus: true,
                        trailing: _cancelSearchBuilder(context),
                        onChanged: (val) {
                          if (val == '') {
                            setState(() => _showingSuggestions = false);
                          } else {
                            setState(() => _showingSuggestions = true);
                          }
                        },
                        onFormSubmitted: (val) => setState(() {
                          _showingResults = true;
                          _showingSuggestions = false;
                        }),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _showingSuggestions
                          ? _searchSuggestionsBuilder()
                          : _showingResults
                              ? ProductsList.vertical(
                                  products: testProducts,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _searchHistoryBuilder(),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    _searchChipsBuilder(context),
                                  ],
                                ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cancelSearchBuilder(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_searchController.text.trim() == '') {
          Navigator.pop(context);
        } else {
          _searchController.clear();
          setState(() {
            _showingResults = false;
            _showingSuggestions = false;
          });
        }
        // DialogProvider(context).showAlertDialog();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: kColorGrey4,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        child: Row(
          children: [
            Icon(
              Icons.close,
              size: 18.0,
              color: kColorGrey,
            ),
            SizedBox(
              width: 2.0,
            ),
            Text(
              'Cancel',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: kColorGrey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchHistoryBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.access_time_filled_rounded,
            size: 18.0,
            color: kColorGrey2,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            'Search History',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: kColorGrey2,
            ),
          )
        ],
      ),
    );
  }

  Widget _searchChipsBuilder(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Wrap(
        runSpacing: 10.0,
        spacing: 15.0,
        children: [
          for (final item in _searchHistoryItems) _searchChipItem(item),
        ],
      ),
    );
  }

  Widget _searchChipItem(final String item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kColorGrey5,
      ),
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
      child: Text(
        item,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
          color: kColorGrey,
        ),
      ),
    );
  }

  Widget _searchSuggestionsBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final _item in _searchSuggestionItems)
            _searchSuggestionItem(_item),
        ],
      ),
    );
  }

  Widget _searchSuggestionItem(final String item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            bottom: 2.0,
            top: 2.0,
          ),
          child: Text(
            item,
            style: TextStyle(
              color: kColorGrey,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // SizedBox(
        //   height: 10.0,
        // ),
        Divider(),
      ],
    );
  }
}
