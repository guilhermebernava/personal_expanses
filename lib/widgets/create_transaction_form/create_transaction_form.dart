import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/models/transaction.dart';
import 'package:personal_expanses/services/route_services.dart';
import 'package:personal_expanses/themes/colors/app_colors.dart';
import 'package:personal_expanses/widgets/create_transaction_form/create_transaction_controller.dart';
import '../../themes/fonts/fonts.dart';
import '../input.dart';

class CreateTransactionForm extends StatefulWidget {
  const CreateTransactionForm({Key? key}) : super(key: key);

  @override
  State<CreateTransactionForm> createState() => _CreateTransactionFormState();
}

class _CreateTransactionFormState extends State<CreateTransactionForm> {
  final controller = CreateTransactionController();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _date;

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
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.8,
                  ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    children: [
                      Text(
                        _date == null
                            ? "No Date"
                            : DateFormat.yMd().format(_date!),
                        style: const TextStyle(
                          fontFamily: Fonts.proximaNova,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var date = await controller.openDatePicker(context);
                          setState(() {
                            _date = date;
                          });
                        },
                        child: const Text(
                          "Select a Date",
                          style: TextStyle(
                            fontFamily: Fonts.opensans,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.026,
                  ),
                  child: ElevatedButton(
                    onPressed: () => controller.createTransaction(
                      context,
                      Transaction(
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          date: _date != null ? _date! : DateTime.now()),
                    ),
                    child: const Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
