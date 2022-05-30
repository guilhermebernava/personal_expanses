import 'package:flutter/material.dart';
import 'package:personal_expanses/themes/fonts/fonts.dart';

class CardTransaction extends Card {
  CardTransaction({
    Key? key,
    required String value,
    required String title,
    required String date,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "R\$$value",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.redAccent,
                  fontFamily: Fonts.opensans,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 150,
                child: ListTile(
                  title: Text(
                    title,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontFamily: Fonts.proximaNova, fontSize: 18),
                  ),
                  subtitle: Text(
                    date,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                  size: 30,
                ),
              )
            ],
          ),
        );
}
