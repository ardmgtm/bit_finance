import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/transaction/transaction.dart';
import '../../domain/repository/transaction_repository.dart';

@injectable
class GetTransactionController extends GetxController {
  final TransactionRepository repository;
  RxBool isError = false.obs;
  RxBool isLoading = false.obs;

  RxList<Transaction> recentTransactions = RxList.empty();
  RxList<Transaction> transactions = RxList.empty();
  RxDouble balance = 0.0.obs;
  RxDouble income = 0.0.obs;
  RxDouble expense = 0.0.obs;

  GetTransactionController(this.repository);

  get isEmpty => transactions.isEmpty;

  _error() {
    isError.value = true;
    recentTransactions.value = RxList.empty();
  }

  getMonthlyTransaction(int month, int year) async {
    isLoading.value = true;
    var res = await repository.getMonthlyTransactions(month, year);
    res.fold(
      (items) {
        isError.value = false;
        recentTransactions.value =
            items.length > 3 ? items.sublist(0, 3) : items;
        expense.value = items
            .where((trx) => trx.type == 0)
            .fold(0, (sum, trx) => sum + trx.nominal);
        income.value = items
            .where((trx) => trx.type == 1)
            .fold(0, (sum, trx) => sum + trx.nominal);
        transactions.value = items;
        balance.value = income.value - expense.value;
      },
      (failure) => _error(),
    );
    isLoading.value = false;
  }
}
