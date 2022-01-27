import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopasal/helpers/no_glow_scroll_behavior.dart';
import 'package:gopasal/wrapper.dart';

void main() {
  runApp(const GOPasalApp());
}

class GOPasalApp extends StatelessWidget {
  const GOPasalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoPasal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: child ?? Container(),
        );
      },
      home: Material(
        child: Wrapper(),
      ),
    );
  }
}
