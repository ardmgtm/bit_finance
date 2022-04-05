import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/transaction/transaction.dart';
import '../../domain/repository/transaction_repository.dart';

@injectable
class HomeController extends GetxController {
  final TransactionRepository repository;

  RxList<Transaction> transactions = RxList.empty();
  RxBool isError = false.obs;
  RxBool isLoading = false.obs;

  HomeController(this.repository);

  get isEmpty => transactions.isEmpty;

  _error() {
    isError.value = true;
    transactions.value = RxList.empty();
  }

  getRecentTransaction() async {
    isLoading.value = true;
    var res = await repository.getRecentTransactions();
    res.fold(
      (items) {
        isError.value = false;
        transactions.value = items;
      },
      (failure) => _error(),
    );
    isLoading.value = false;
  }
}
