import 'package:flutter/material.dart';

class AppColors {
  static const greyBlueShadow = Color.fromARGB(169, 96, 125, 139);
  static const orange = Color(0xFFFE6601);
  static const orangeContrast = Color(0xff00A9B3);
  static const white = Color(0xffF5F5F5);
  static const gradient = LinearGradient(
    colors: [Color(0xff00bcd4), Color(0xff47a44b)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const gradintBottomBar = LinearGradient(
    colors: [Color(0xff009688), Color(0xff607d8b)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
