import 'package:flutter/material.dart';
import 'package:personal_expanses/models/transaction.dart';
import 'package:personal_expanses/pages/home/home_controller.dart';
import 'package:personal_expanses/themes/colors/app_colors.dart';
import 'package:personal_expanses/themes/fonts/fonts.dart';
import 'package:personal_expanses/widgets/bottom_navibar_widget.dart';
import 'package:personal_expanses/widgets/button_navibar.dart';
import 'package:personal_expanses/widgets/chart.dart';
import 'package:personal_expanses/widgets/image_background.dart';
import '../../widgets/list_transactions.dart';

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
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          const BottomNavibarWidget(),
          ButtonNavibar(context, controller),
        ],
      ),
      appBar: AppBar(
          title: const Text(
            "Personal Expanses",
            style: TextStyle(
              fontFamily: Fonts.opensans,
              fontSize: 25,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 40,
                ),
                onPressed: () => controller.openTransactionModal(context),
              ),
            ),
          ]),
      body: ValueListenableBuilder<List<Transaction>>(
        valueListenable: controller.transactionNotifier,
        builder: (_, transactions, __) => transactions.isEmpty
            ? ImageBackground()
            : Column(
                children: [
                  Chart(),
                  ListTransactions(context, transactions, controller)
                ],
              ),
      ),
    );
  }
}
