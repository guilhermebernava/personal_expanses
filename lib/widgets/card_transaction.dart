import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/themes/fonts/fonts.dart';

class CardTransaction extends Padding {
  CardTransaction(
    BuildContext context, {
    Key? key,
    required String value,
    required String title,
    required DateTime date,
    required VoidCallback onPressed,
  }) : super(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.015),
          key: key,
          child: Card(
            elevation: 4,
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
                  width: MediaQuery.of(context).size.width / 2,
                  child: ListTile(
                    title: Text(
                      title,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontFamily: Fonts.proximaNova, fontSize: 18),
                    ),
                    subtitle: Text(
                      DateFormat.yMEd().format(date),
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
          ),
        );
}
