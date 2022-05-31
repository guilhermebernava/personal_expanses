import 'package:intl/intl.dart';
import 'package:personal_expanses/database/daos/transaction_dao.dart';

class ChartController {
  List<Map<String, dynamic>> get transactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double total = 0.0;
      TransactionDao.findAll().then((value) {
        for (int i = 0; i < value.length; i++) {
          if (value[i].date == "5/25/2022") {
            total += value[i].amount;
          }
        }
      });
      return {"day": DateFormat.E().format(weekDay), 'amount': total};
    }).toList();
  }
}
