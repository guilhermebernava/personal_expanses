import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_expanses/themes/TextStyles/text_styles.dart';
import 'package:personal_expanses/widgets/opacity_show.dart';
import 'package:personal_expanses/widgets/show_up.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: visible
            ? Builder(
                builder: (context) => const ShowUp(
                  delay: 600,
                  child: OpacityShow(
                    child: Text(
                      'Personal Expanses',
                      style: TextStyles.splashTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : AnimatedTextKit(
                repeatForever: false,
                totalRepeatCount: 3,
                pause: const Duration(milliseconds: 500),
                animatedTexts: [
                  ScaleAnimatedText(
                    'Personal Expanses',
                    scalingFactor: 0.35,
                    textStyle: TextStyles.splashTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
                onFinished: () {
                  setState(() {
                    visible = true;
                  });
                },
              ),
      ),
    );
  }
}
