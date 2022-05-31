import 'package:flutter/material.dart';
import 'package:personal_expanses/themes/colors/app_colors.dart';

class ChartBar extends Padding {
  ChartBar(
    BuildContext context, {
    Key? key,
    required double totalValue,
    required double heightFactor,
    required String day,
  }) : super(
          key: key,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.05,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Column(
            children: [
              Text("\$$totalValue"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.025,
                height: MediaQuery.of(context).size.height * 0.1,
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
