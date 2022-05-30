import 'package:flutter/material.dart';
import 'package:personal_expanses/themes/fonts/fonts.dart';
import '../colors/app_colors.dart';

class TextStyles {
  static const splashTitle = TextStyle(
    fontFamily: Fonts.proximaNova,
    color: Colors.white,
    fontSize: 62,
    shadows: [
      Shadow(
        color: AppColors.orangeContrast,
        offset: Offset(-6, 7),
        blurRadius: 3,
      )
    ],
  );

  static const error = TextStyle(
    fontFamily: Fonts.proximaNova,
    color: Colors.redAccent,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
