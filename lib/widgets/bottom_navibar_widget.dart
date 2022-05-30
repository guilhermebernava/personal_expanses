import 'package:flutter/material.dart';

import '../themes/colors/app_colors.dart';

class BottomNavibarWidget extends StatelessWidget {
  const BottomNavibarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        color: AppColors.orange,
      ),
    );
  }
}
