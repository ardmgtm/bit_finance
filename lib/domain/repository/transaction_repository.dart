import 'package:dartz/dartz.dart';

import '../entity/transaction/transaction.dart';
import '../failure/transaction_failure.dart';

abstract class TransactionRepository {
  Future<Either<Transaction, TransactionFailure>> createTransaction(
    Transaction transaction,
  );
  Future<Either<List<Transaction>, TransactionFailure>> getMonthlyTransactions(
    int month,
    int year,
  );
}
