import 'package:flutter/material.dart';
import '../themes/colors/app_colors.dart';

class ButtonNavibar extends Padding {
  ButtonNavibar(BuildContext context, dynamic controller, {Key? key})
      : super(
          key: key,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: AppColors.greyBlueShadow,
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 1.5),
                )
              ], shape: BoxShape.circle, color: Theme.of(context).primaryColor),
              child: const Icon(
                Icons.add_circle,
                size: 70,
                color: AppColors.white,
              ),
            ),
            onTap: () => controller.openTransactionModal(context),
          ),
        );
}
