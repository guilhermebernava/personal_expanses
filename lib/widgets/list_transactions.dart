import 'package:flutter/material.dart';
import '../database/daos/transaction_dao.dart';
import 'card_transaction.dart';

class ListTransactions extends SizedBox {
  ListTransactions(
      BuildContext context, dynamic transactions, dynamic controller,
      {Key? key})
      : super(
            key: key,
            height: MediaQuery.of(context).size.height * 0.51,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => CardTransaction(
                value: transactions[index].amount.toString(),
                title: transactions[index].title,
                date: transactions[index].date,
                onPressed: () async {
                  await TransactionDao.delete(transactions[index]);
                  await controller.getTransactions();
                },
              ),
            ));
}
