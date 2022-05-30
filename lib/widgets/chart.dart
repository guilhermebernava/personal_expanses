import 'package:flutter/material.dart';

class Chart extends Card {
  Chart({Key? key})
      : super(
          key: key,
          elevation: 6,
          margin: const EdgeInsets.all(20),
          child: Container(
            width: 400,
            height: 150,
            color: Colors.amber,
          ),
        );
}
