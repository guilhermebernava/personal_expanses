import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expanses/models/transaction.dart';
import 'package:personal_expanses/services/route_services.dart';
import 'package:personal_expanses/themes/colors/app_colors.dart';
import 'package:personal_expanses/widgets/create_transaction_form/create_transaction_controller.dart';
import '../input.dart';

class CreateTransactionForm extends StatelessWidget {
  CreateTransactionForm({Key? key}) : super(key: key);

  final controller = CreateTransactionController();

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 300.0),
                  child: IconButton(
                    onPressed: () => RoutesServices.returnTo(context),
                    icon: const Icon(Icons.close_outlined),
                  ),
                ),
                const Text(
                  "Create a Transaction",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                InputWidget(
                  context,
                  label: "Title",
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Title can't be null";
                    }

                    if (value.length < 3) {
                      return "Title can't be less than 3 words";
                    }

                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z /s]+$')),
                  ],
                  keyboardType: TextInputType.multiline,
                ),
                InputWidget(
                  context,
                  label: "Amount",
                  controller: amountController,
                  validator: (value) {
                    if (value == null) {
                      return "Amount can't be null";
                    }

                    if (double.parse(value) <= 0) {
                      return "Amount can't be less than 0.0";
                    }

                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 \s .]')),
                  ],
                  keyboardType: TextInputType.multiline,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () => controller.createTransaction(
                      context,
                      Transaction(
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          date: "1/1/2000"),
                    ),
                    child: const Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
