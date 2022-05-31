import 'package:intl/intl.dart';
import 'package:personal_expanses/database/daos/transaction_dao.dart';

class ChartController {
  Future<List<Map<String, dynamic>>> transactions() async {
    var list = await TransactionDao.findAll();
    var itemValue = 100 / list.length;

    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var total = 0.0;
      var height = 0.0;

      for (int i = 0; i < list.length; i++) {
        if (list[i].date.day == weekDay.day &&
            list[i].date.month == weekDay.month &&
            list[i].date.year == weekDay.year) {
          total += list[i].amount;
          height += itemValue;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay),
        'amount': total,
        'heightValue': height / 100
      };
    }).toList();
  }

  double highetFraction(List<Map<dynamic, dynamic>> data) {
    return data.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }
}
