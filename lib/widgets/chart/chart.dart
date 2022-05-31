import 'package:flutter/material.dart';
import 'package:personal_expanses/widgets/chart/chart_bar.dart';
import 'package:personal_expanses/widgets/chart/chart_controller.dart';
import '../../themes/text_styles/text_styles.dart';

class Chart extends Card {
  static final controller = ChartController();
  static final list = <Map<String, dynamic>>[];
  Chart(BuildContext context, {Key? key})
      : super(
          key: key,
          elevation: 6,
          margin: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.025,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              initialData: list,
              future: controller.transactions(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var maps = snapshot.data as List<Map<dynamic, dynamic>>;
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: maps
                          .map(
                            (e) => ChartBar(
                              context,
                              totalValue: e['amount'],
                              heightFactor: e['heightValue'],
                              day: e['day'],
                            ),
                          )
                          .toList());
                }
                return const Center(
                  child: Text(
                    "ERROR OCURRED!!",
                    style: TextStyles.errorFuture,
                  ),
                );
              },
            ),
          ),
        );
}
