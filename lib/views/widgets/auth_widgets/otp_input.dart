import 'package:flutter/material.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({Key? key}) : super(key: key);

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      textStyle: TextStyle(
        fontSize: 28.0,
      ),
      length: 4,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(20.0),
        fieldHeight: 52.0,
        fieldWidth: 75.0,
        activeFillColor: kColorLightGrey,
        inactiveFillColor: kColorLightGrey,
        inactiveColor: kColorLightGrey,
        selectedFillColor: kColorLightGrey,
        selectedColor: kColorLightGrey,
        borderWidth: 1.5,
      ),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: (v) {},
      onChanged: (value) {},
    );
  }
}
