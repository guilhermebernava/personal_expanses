import 'package:flutter/material.dart';
import 'package:personal_expanses/themes/colors/app_colors.dart';

class ChartBar extends Padding {
  ChartBar({
    Key? key,
    required double totalValue,
    required double heightFactor,
    required String day,
  }) : super(
          key: key,
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Text("\$$totalValue"),
              SizedBox(
                width: 10,
                height: 70,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: heightFactor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ]),
              ),
              Text(day)
            ],
          ),
        );
}
