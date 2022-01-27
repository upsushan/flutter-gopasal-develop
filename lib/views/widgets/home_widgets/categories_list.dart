import 'package:flutter/material.dart';
import 'package:gopasal/models/category_model.dart';
import 'package:gopasal/views/widgets/home_widgets/category_list_item.dart';

class CategoriesList extends StatefulWidget {
  final List<Category> categories;
  final Function(Category)? onCategorySelect;
  const CategoriesList({
    Key? key,
    required this.categories,
    this.onCategorySelect,
  }) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final _widget = CategoryItem(
            category: widget.categories[index],
            onCategorySelect: (cat) {
              widget.onCategorySelect?.call(cat);
            },
          );

          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: _widget,
            );
          }
          return _widget;
        },
      ),
    );
  }
}
