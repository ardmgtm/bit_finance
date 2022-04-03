import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/transaction/transaction.dart';
import '../../domain/repository/transaction_repository.dart';

@injectable
class HomeController extends GetxController {
  final TransactionRepository repository;

  RxList<Transaction> transactions = RxList.empty();
  RxBool isError = false.obs;

  HomeController(this.repository);

  get isEmpty => transactions.isEmpty;

  _error() {
    isError = true.obs;
    transactions = RxList.empty();
  }

  getRecentTransaction() async {
    var res = await repository.getRecentTransactions();
    res.fold(
      (items) {
        isError = false.obs;
        transactions = items.obs;
      },
      (failure) => _error(),
    );
  }
}
