import 'package:flutter/material.dart';
import 'package:gopasal/views/widgets/common_widgets/main_drawer.dart';
import 'package:gopasal/views/widgets/home_widgets/home_view.dart';
import 'package:gopasal/views/widgets/home_widgets/sub_categories_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _home = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      drawer: MainDrawer(),
      body: SafeArea(
        child: _home
            ? HomeView(
                onPressedCategory: (cat) {
                  setState(() {
                    _home = cat.title == 'Home';
                  });
                },
              )
            : SubCategoriesView(
                onPressedCategory: (cat) {
                  setState(() {
                    _home = cat.title == 'Home';
                  });
                },
              ),
      ),
    );
  }
}
