import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gopasal/utils/app_colors.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final bool autoFocus;
  final String hintText;
  final Function()? onPressed;
  final Function(String)? onFormSubmitted;
  final Function(String)? onChanged;
  final bool enabled;
  final Widget? trailing;
  final bool requiredPadding;
  final double? height;
  const SearchBar({
    Key? key,
    this.controller,
    this.autoFocus = false,
    this.hintText = 'Search Anything',
    this.onPressed,
    this.onFormSubmitted,
    this.onChanged,
    this.enabled = true,
    this.trailing,
    this.requiredPadding = true,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: requiredPadding ? 15.0 : 0.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: kColorGrey5,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/svgs/search.svg'),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  child: TextFormField(
                    controller: controller,
                    autofocus: autoFocus,
                    enabled: enabled,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: onFormSubmitted,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: kColorGrey,
                      ),
                    ),
                  ),
                ),
              ),
              if (trailing != null)
                SizedBox(
                  width: 10.0,
                ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
