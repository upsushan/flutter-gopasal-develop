import 'package:flutter/material.dart';
import 'package:gopasal/views/screens/auth/auth_screen.dart';
import 'package:gopasal/views/screens/splash_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 4000),
      () => setState(() => _loading = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? SplashScreen() : AuthScreen();
  }
}
