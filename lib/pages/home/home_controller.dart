import 'package:flutter/material.dart';
import 'package:personal_expanses/database/daos/transaction_dao.dart';
import 'package:personal_expanses/models/transaction.dart';

class HomeController {
  /* 
  cria uma forma de comunicar quando o WIDGET deverá ser recriado, atráves de 
  um NOTIFIER que sempre que se valor for alterado vai REBUILDAR o WIDGET.
  */

  final transactionNotifier = ValueNotifier(<Transaction>[]);
  List<Transaction> get transactions => transactionNotifier.value;
  set transactions(List<Transaction> value) =>
      transactionNotifier.value = value;

  HomeController() {
    getTransactions();
  }

  Future<void> getTransactions() async {
    try {
      //busca os dados no banco de dados.
      final result = await TransactionDao.findAll();
      //coloca os valore do banco no VALUE NOTIFIER
      transactions = result;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
