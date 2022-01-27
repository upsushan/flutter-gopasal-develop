import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gopasal/models/category_model.dart';
import 'package:gopasal/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final Function(Category)? onCategorySelect;
  const CategoryItem({
    Key? key,
    required this.category,
    this.onCategorySelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCategorySelect?.call(category);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
          bottom: 12.0,
          top: 12.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: kColorGrey.withOpacity(0.20),
                offset: Offset(2, 2),
                blurRadius: 2.2,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: category.color.withOpacity(0.25),
            ),
            padding: const EdgeInsets.only(
              left: 5.0,
              right: 15.0,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: category.title == 'Home' ? 0.0 : 3.0,
                    bottom: category.title == 'Home' ? 4.0 : 0.0,
                    right: category.title == 'Home' ? 8.0 : 0.0,
                    left: category.title == 'Home' ? 3.0 : 0.0,
                  ),
                  child: Image.asset(
                    category.imgUrl,
                    width: category.title == 'Home' ? 22.0 : null,
                    height: category.title == 'Home' ? 22.0 : null,
                  ),
                ),
                Text(
                  category.title,
                  style: TextStyle(
                    color: category.color,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.35,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
