import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/transaction/transaction.dart';
import '../../domain/repository/transaction_repository.dart';

@injectable
class AddTransactionController extends GetxController {
  final TransactionRepository repository;
  RxBool isError = false.obs;

  AddTransactionController(this.repository);

  _error() {
    isError = true.obs;
  }

  createTransaction(Transaction transaction) async {
    var res = await repository.createTransaction(transaction);
    res.fold(
      (item) {
        isError = false.obs;
      },
      (failure) => _error(),
    );
  }
}
