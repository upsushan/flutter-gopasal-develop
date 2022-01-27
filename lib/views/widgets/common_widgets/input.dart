import 'package:flutter/material.dart';
import 'package:gopasal/utils/app_colors.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool password;
  final TextEditingController? controller;
  final Color? primaryColor;
  final TextInputType? type;

  const TextInput({
    Key? key,
    this.hintText = '',
    this.leftIcon,
    this.rightIcon,
    this.password = false,
    this.controller,
    this.primaryColor,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: kColorGrey5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          if (leftIcon != null) leftIcon!,
          if (leftIcon != null)
            SizedBox(
              width: 10.0,
            ),
          Expanded(
            child: TextFormField(
              obscureText: password,
              controller: controller,
              keyboardType: type,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: kColorDarkGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (rightIcon != null)
            SizedBox(
              width: 10.0,
            ),
          if (rightIcon != null) rightIcon!,
        ],
      ),
    );
  }
}
