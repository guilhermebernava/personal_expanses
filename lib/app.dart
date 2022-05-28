import 'package:flutter/material.dart';
import 'package:personal_expanses/pages/home/home.dart';
import 'package:personal_expanses/pages/splash/splash.dart';
import 'package:personal_expanses/themes/colors/app_colors.dart';
import 'package:personal_expanses/themes/colors/theme_colors.dart';
import 'package:personal_expanses/themes/fonts/fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expanses',
      theme: ThemeData(
        fontFamily: Fonts.monospace,
        primarySwatch:
            const MaterialColor(ThemeColors.color, ThemeColors.colors),
        backgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const Splash(),
        "/home": (context) => const Home(),
      },
    );
  }
}
