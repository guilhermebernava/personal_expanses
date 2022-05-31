import 'package:flutter/material.dart';
import 'package:personal_expanses/widgets/chart/chart_bar.dart';
import 'package:personal_expanses/widgets/chart/chart_controller.dart';

class Chart extends Card {
  static final controller = ChartController();
  Chart({Key? key})
      : super(
          key: key,
          elevation: 6,
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: controller.transactions
                    .map((e) => ChartBar(
                        totalValue: e['amount'],
                        heightFactor: 1,
                        day: e['day']))
                    .toList()),
          ),
        );
}
