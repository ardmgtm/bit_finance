import 'dart:math';

import 'package:bit_finance/domain/entity/transaction/transaction.dart';
import 'package:bit_finance/domain/failure/transaction_failure.dart';
import 'package:bit_finance/infrastructure/local_data_source/transaction/transaction_local_data_source.dart';
import 'package:bit_finance/infrastructure/repository/transaction_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transaction_repository_impl_test.mocks.dart';

@GenerateMocks([TransactionLocalDataSource])
void main() {
  late MockTransactionLocalDataSource dataSource;
  late TransactionRepositoryImpl repositoryImpl;

  setUp(() {
    dataSource = MockTransactionLocalDataSource();
    repositoryImpl = TransactionRepositoryImpl(dataSource);
  });

  Transaction trx = Transaction(
    type: 0,
    nominal: 1000,
    dateTime: DateTime.now(),
    category: 0,
    description: 'description',
  );

  group(
    'Create Transaction',
    () {
      test('Return Transaction when transaction successfull created', () async {
        when(dataSource.createTransaction(any))
            .thenAnswer((_) async => trx.copyWith(id: 0));

        final res = await repositoryImpl.createTransaction(trx);

        verify(dataSource.createTransaction(trx));
        expect(res, Left(trx.copyWith(id: 0)));
      });
      test('Return TransactionFailure when failed to create a transaction',
          () async {
        when(dataSource.createTransaction(any)).thenThrow((_) => Exception());

        final res = await repositoryImpl.createTransaction(trx);

        verify(dataSource.createTransaction(trx));
        expect(res, const Right(TransactionFailure.unexpected()));
      });
    },
  );
}
