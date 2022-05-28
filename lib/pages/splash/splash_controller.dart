import 'package:flutter/material.dart';
import 'package:personal_expanses/services/route_services.dart';

class SplashController {
  static void redirectOnAnimationEnd(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5), () {
      RoutesServices.redirectTo(context, "/home");
    });
  }
}
