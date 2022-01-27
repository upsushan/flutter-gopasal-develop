import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/screens/home/bag_screen.dart';
import 'package:gopasal/views/screens/home/orders_screen.dart';
import 'package:gopasal/views/screens/tags_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                _headerBuilder(context),
                SizedBox(
                  height: 20.0,
                ),
                _optionsBuilder(context),
              ],
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SvgPicture.asset(
                'assets/svgs/drawer_bottom.svg',
                width: constraints.maxWidth,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _headerBuilder(final BuildContext context) {
    final _statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kColorLightGrey,
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: _statusBarHeight,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 49.0,
                    height: 49.0,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kColorGrey,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      'Rajib',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionsBuilder(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _optionsItem(
          context: context,
          img: 'assets/svgs/home.svg',
          title: 'Home',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TagScreen(),
              ),
            );
          },
        ),
        _optionsItem(
          context: context,
          img: 'assets/svgs/contact.svg',
          title: 'Contact Us',
          onPressed: () {},
        ),
        Divider(),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Account',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: kColorGrey,
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        _optionsItem(
          context: context,
          img: 'assets/svgs/shopping_bag_grey.svg',
          title: 'My Bags',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BagScreen(),
              ),
            );
          },
        ),
        _optionsItem(
          context: context,
          img: 'assets/svgs/order.svg',
          title: 'My Orders',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OrderScreen(),
            ),
          ),
        ),
        _optionsItem(
          context: context,
          img: 'assets/svgs/logout.svg',
          title: 'Logout',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _optionsItem({
    required final BuildContext context,
    required final String img,
    required final String title,
    required final Function() onPressed,
  }) {
    return ListTile(
      leading: SvgPicture.asset(img),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: kColorBlack,
          fontSize: 16.0,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onPressed();
      },
    );
  }
}
