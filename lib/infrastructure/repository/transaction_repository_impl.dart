import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/transaction/transaction.dart';
import '../../domain/failure/transaction_failure.dart';
import '../../domain/repository/transaction_repository.dart';
import '../local_data_source/transaction/transaction_local_data_source.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource dataSource;

  TransactionRepositoryImpl(this.dataSource);

  @override
  Future<Either<Transaction, TransactionFailure>> createTransaction(
    Transaction transaction,
  ) async {
    try {
      var res = await dataSource.createTransaction(transaction);
      return Left(res);
    } catch (e) {
      return const Right(TransactionFailure.unexpected());
    }
  }

  @override
  Future<Either<List<Transaction>, TransactionFailure>> getMonthlyTransactions(
      int month, int year) async {
    try {
      var res = await dataSource.getMonthlyTransaction(month, year);
      return Left(res);
    } catch (e) {
      return const Right(TransactionFailure.unexpected());
    }
  }

  @override
  Future<DateTime> getEarliestTransactionDate() async {
    try {
      var date = await dataSource.getEarliestTransactionDate();
      return date;
    } catch (e) {
      return DateTime.now();
    }
  }
}
