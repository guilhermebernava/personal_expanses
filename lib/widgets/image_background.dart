import 'package:flutter/material.dart';
import 'package:personal_expanses/themes/fonts/fonts.dart';
import '../themes/colors/app_colors.dart';
import '../themes/images/app_images.dart';

class ImageBackground extends Padding {
  ImageBackground({Key? key})
      : super(
          key: key,
          padding: const EdgeInsets.only(
            top: 100.0,
            left: 130,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Text(
                  "No transactions...",
                  style: TextStyle(
                    fontFamily: Fonts.quicksand,
                    fontSize: 18,
                  ),
                ),
              ),
              Image.asset(
                AppImages.waiting,
                scale: 3,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                color: AppColors.orange,
                filterQuality: FilterQuality.high,
              ),
            ],
          ),
        );
}
