import 'package:flutter/material.dart';

class RoutesServices {
  static void redirectTo(BuildContext context, String route) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static void redirectToWithReturn(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  static void redirectToWithArguments(
      BuildContext context, String route, String args) {
    Navigator.pushNamed(context, route, arguments: args);
  }

  static void returnTo(BuildContext context) {
    Navigator.pop(context);
  }
}
