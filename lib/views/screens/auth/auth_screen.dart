import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:gopasal/utils/app_colors.dart';
import 'package:gopasal/views/screens/home/home_screen.dart';
import 'package:gopasal/views/widgets/auth_widgets/otp_input.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final _pageController = PageController();

  void _scrollPageView(final BuildContext context) {
    FocusScope.of(context).unfocus();
    _pageController.animateTo(
      MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                _numberBuilder(context),
                _otpBuilder(context),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
      bottomNavigationBar: _footerBuilder(),
    );
  }

  Widget _numberBuilder(final BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              _headerBuilder(
                imgUrl: 'assets/images/phone_in_hand.png',
                title: 'Number Verification',
                subtitle:
                    'We need to register your Mobile Number\nbefore getting started.',
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: kColorLightGrey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Text(
                      '+977',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: TextFormField(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 27.0,
              ),
              _buttonBuilder(
                'Send OTP Code',
                onPressed: () => _scrollPageView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBuilder(final BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              _headerBuilder(
                imgUrl: 'assets/images/phone_in_hand_2.png',
                title: 'Enter OTP Code',
                subtitle:
                    'We have just sent you the OTP code\nplease enter below.',
              ),
              SizedBox(
                height: 30.0,
              ),
              OtpInput(),
              SizedBox(
                height: 27.0,
              ),
              _buttonBuilder(
                'Verify Mobile Number',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonBuilder(
    final String value, {
    Function()? onPressed,
  }) {
    return FoodWithLoveButton.filled(
      value: value,
      color: kColorGreen,
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      borderRadius: 20.0,
      padding: const EdgeInsets.symmetric(vertical: 17.0),
      onPressed: onPressed ?? () {},
    );
  }

  Widget _headerBuilder({
    required final String imgUrl,
    required final String title,
    required final String subtitle,
  }) {
    return Column(
      children: [
        Image.asset(
          imgUrl,
          width: 230.0,
          height: 230.0,
        ),
        SizedBox(
          height: 40.0,
        ),
        FoodWithLoveText.heading2(title),
        SizedBox(
          height: 10.0,
        ),
        FoodWithLoveText.body(
          subtitle,
          style: TextStyle(
            fontSize: 16.0,
            color: kColorGrey,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _footerBuilder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/language.svg'),
            SizedBox(
              width: 5.0,
            ),
            FoodWithLoveText.body(
              'नेपाली भाषामा हेर्नुहोस्',
              style: TextStyle(
                fontSize: 16.0,
                color: kColorGrey,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 50.0,
        ),
        Image.asset('assets/images/vegetables.png'),
      ],
    );
  }
}
