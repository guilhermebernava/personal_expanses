import 'package:flutter/material.dart';

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
                "R\$${value.replaceAll(".", ",")}",
                style: const TextStyle(fontSize: 15, color: Colors.redAccent),
              ),
              SizedBox(
                width: 150,
                child: ListTile(
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    date,
                    textAlign: TextAlign.center,
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
