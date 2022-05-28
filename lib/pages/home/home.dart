import 'package:flutter/material.dart';
import 'package:personal_expanses/database/daos/transaction_dao.dart';
import 'package:personal_expanses/models/transaction.dart';
import 'package:personal_expanses/pages/home/home_controller.dart';
import 'package:personal_expanses/themes/colors/app_colors.dart';
import 'package:personal_expanses/widgets/card_transaction.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personal Expanses"), actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.add_box_outlined,
              color: AppColors.white,
              size: 40,
            ),
            onPressed: () async {
              await TransactionDao.save(
                Transaction(
                  title: "Teste 2",
                  amount: 10.0,
                  date: "21/02/2000",
                ),
              );
              await controller.getTransactions();
            },
          ),
        ),
      ]),
      body: ValueListenableBuilder<List<Transaction>>(
        valueListenable: controller.transactionNotifier,
        builder: (_, transactions, __) => ListView.builder(
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
        ),
      ),
    );
  }
}
