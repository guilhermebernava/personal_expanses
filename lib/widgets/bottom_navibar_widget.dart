import 'package:flutter/material.dart';

import '../themes/colors/app_colors.dart';

class BottomNavibarWidget extends StatelessWidget {
  const BottomNavibarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: ClipPath(
        clipper: CustomClip(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.11,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: AppColors.gradintBottomBar,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyBlueShadow,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, -10),
                ),
              ]),
        ),
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height / 3);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
