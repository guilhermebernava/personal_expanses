import 'package:flutter/material.dart';
import 'package:personal_expanses/database/daos/transaction_dao.dart';
import 'package:personal_expanses/models/transaction.dart';
import 'package:personal_expanses/services/validation_services.dart';
import '../../services/route_services.dart';

class CreateTransactionController {
  final formKey = GlobalKey<FormState>();

  void createTransaction(BuildContext context, Transaction model) {
    validationTransaction(context, model).then((value) {
      if (value) {
        RoutesServices.returnTo(context);
      }
      return;
    });
  }

  Future<bool> validationTransaction(
      BuildContext context, Transaction model) async {
    final isValid = ValidationServices.validateInputs(formKey);
    if (!isValid) {
      return false;
    }
    await TransactionDao.save(model);
    return true;
  }
}
