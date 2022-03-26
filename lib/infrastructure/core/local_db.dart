import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../local_data_source/transaction/transaction_table.dart';

class LocalDb {
  static Database? _database;
  static final LocalDb instance = LocalDb._init();

  LocalDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initiateDatabase();
    return _database!;
  }

  static Future<Database> _initiateDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bit_pos.db');

    // await deleteDatabase(path);
    Database _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(transactoinTableQuery);
      },
    );
    return _db;
  }
}
