import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:gopasal/utils/app_colors.dart';

class DialogProvider {
  final BuildContext context;
  DialogProvider(this.context);

  Future<void> showNormalDialog({
    required final Widget widget,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          insetPadding: const EdgeInsets.all(15.0),
          child: widget,
        );
      },
    );
  }

  Future<void> showAlertDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          insetPadding: const EdgeInsets.all(15.0),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
            bottom: 20.0,
            left: 24.0,
            right: 24.0,
          ),
          title: Text(
            'Do you really want to do it?',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Doing it can be bad for you. It will destroy your data. Doing it can be bad for you. It will destroy your data. Doing it can be bad for you. It will  destroy your data.',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kColorGrey,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoodWithLoveButton.filled(
                    value: 'Yes',
                    color: kColorLightRed,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 60.0,
                    ),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    borderRadius: 10.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FoodWithLoveButton.filled(
                    value: 'No',
                    color: kColorGreen,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 60.0,
                    ),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    borderRadius: 10.0,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
