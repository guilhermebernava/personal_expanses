import 'package:personal_expanses/models/transaction.dart';
import '../database.dart';

class TransactionDao {
  static const tableName = "transactions";

  static const createTable = "CREATE TABLE transactions ("
      "id INTEGER PRIMARY KEY,"
      "title TEXT,"
      "amount REAL,"
      "date TEXT"
      ")";

  static Future<int> save(Transaction model) {
    return createDatabase().then((db) => db.insert(tableName, model.toMap()));
  }

  static Future<List<Transaction>> findAll() {
    return createDatabase().then(
      (db) => db.query(tableName).then((maps) {
        final transactions = <Transaction>[];
        for (Map<String, dynamic> map in maps) {
          final transaction = Transaction.fromMap(map);
          transactions.add(transaction);
        }
        return transactions;
      }),
    );
  }

  static Future<List<Transaction>> findByName(String name) {
    return createDatabase().then(
      (db) => db.query(tableName,
          where: "name LIKE ? ", whereArgs: ['%$name%']).then((maps) {
        final transactions = <Transaction>[];
        for (Map<String, dynamic> map in maps) {
          final transaction = Transaction.fromMap(map);
          transactions.add(transaction);
        }
        return transactions;
      }),
    );
  }

  static Future<int> delete(Transaction model) async {
    final db = await createDatabase();
    final res =
        await db.delete(tableName, where: "id = ?", whereArgs: [model.id]);

    return res;
  }
}
