import 'package:flutter/material.dart';
import 'package:personal_expanses/themes/fonts/fonts.dart';
import '../themes/colors/app_colors.dart';
import '../themes/images/app_images.dart';

class ImageBackground extends Padding {
  ImageBackground(BuildContext context, {Key? key})
      : super(
          key: key,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.32,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: const Text(
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
