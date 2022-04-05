import 'package:injectable/injectable.dart';

import '../../../domain/entity/transaction/transaction.dart';
import '../../core/local_db.dart';

@lazySingleton
class TransactionLocalDataSource {
  LocalDb localDb = LocalDb.instance;

  Future<Transaction> createTransaction(Transaction transaction) async {
    var db = await localDb.database;
    var id = await db.insert(transactionTable, transaction.toJson());

    Transaction newTransaction = transaction.copyWith(id: id);
    return newTransaction;
  }

  Future<List<Transaction>> getRecentTransaction() async {
    var db = await localDb.database;
    var jsons = await db.query(
      transactionTable,
      limit: 5,
      orderBy: '$columnDateTime DESC',
    );
    List<Transaction> recentTransaction =
        jsons.map((json) => Transaction.fromJson(json)).toList();
    return recentTransaction;
  }
}
