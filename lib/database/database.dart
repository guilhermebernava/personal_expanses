import 'package:personal_expanses/database/daos/transaction_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void populateDb(Database database, int version) async {
  await database.execute(TransactionDao.createTable);
}

Future<Database> createDatabase() async {
  String databasesPath = await getDatabasesPath();
  String dbPath = join(databasesPath, 'personal_expanses.db');

  var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);

  return database;
}
