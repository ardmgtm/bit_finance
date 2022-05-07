import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/transaction/transaction.dart';
import '../../core/local_db.dart';

@lazySingleton
class TransactionLocalDataSource {
  final LocalDb localDb = LocalDb.instance;

  Future<Transaction> createTransaction(Transaction transaction) async {
    var db = await localDb.database;
    var id = await db.insert(transactionTable, transaction.toJson());

    Transaction newTransaction = transaction.copyWith(id: id);
    return newTransaction;
  }

  Future<List<Transaction>> getMonthlyTransaction(int month, int year) async {
    var db = await localDb.database;
    var jsons = await db.query(
      transactionTable,
      where: "strftime('%Y-%m', $columnDateTime) = ?",
      whereArgs: ['$year-${month.toString().padLeft(2, '0')}'],
      orderBy: '$columnDateTime DESC',
    );
    List<Transaction> recentTransaction =
        jsons.map((json) => Transaction.fromJson(json)).toList();
    return recentTransaction;
  }

  Future<DateTime> getEarliestTransactionDate() async {
    var db = await localDb.database;
    var json = await db.query(
      transactionTable,
      orderBy: '$columnDateTime ASC',
      limit: 1,
    );
    DateTime date = DateTime.parse(json[0][columnDateTime].toString());
    return date;
  }
}
