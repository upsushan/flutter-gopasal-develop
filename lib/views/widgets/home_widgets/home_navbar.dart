import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/screens/home/search_screen.dart';
import 'package:gopasal/views/widgets/common_widgets/search_bar.dart';

class HomeAppbar extends StatelessWidget {
  final bool requiredSearchButton;
  final bool requiredSearchBar;
  final Widget? leading;
  final Widget? title;
  final Function()? onPressed;
  const HomeAppbar({
    Key? key,
    this.requiredSearchButton = true,
    this.requiredSearchBar = false,
    this.leading,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: requiredSearchBar ? 10.0 : 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          requiredSearchBar
              ? Expanded(
                  child: SearchBar(
                    hintText: 'Search Broccoli, Apple, Badam, etc ',
                    requiredPadding: false,
                    enabled: false,
                    height: 45.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchScreen(),
                        ),
                      );
                    },
                  ),
                )
              : Row(
                  children: [
                    leading ??
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset('assets/svgs/menu.svg'),
                        ),
                    SizedBox(
                      width: 15.0,
                    ),
                    title ??
                        Row(
                          children: [
                            SvgPicture.asset('assets/svgs/location_marker.svg'),
                            SizedBox(
                              width: 5.0,
                            ),
                            FoodWithLoveText.heading3(
                              'Birtamode',
                              style: TextStyle(
                                color: kColorGreen,
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
          Row(
            children: [
              if (requiredSearchButton)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SvgPicture.asset(
                      'assets/svgs/search.svg',
                      color: kColorGreen,
                    ),
                  ),
                ),
              SizedBox(
                width: 20.0,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onPressed,
                    child: SvgPicture.asset('assets/svgs/shopping_bag.svg'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
