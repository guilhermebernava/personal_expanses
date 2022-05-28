import 'dart:async';
import 'package:flutter/material.dart';

class OpacityShow extends StatefulWidget {
  final Widget child;

  const OpacityShow({
    super.key,
    required this.child,
  });

  @override
  OpacityShowState createState() => OpacityShowState();
}

class OpacityShowState extends State<OpacityShow> {
  bool _visible = false;
  late Timer visibleTimer;

  @override
  void initState() {
    super.initState();
    visibleTimer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _visible = !_visible;
      });
      visibleTimer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.ease,
      alwaysIncludeSemantics: true,
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      child: widget.child,
    );
  }
}
