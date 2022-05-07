import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/transaction/transaction.dart';
import 'get_transaction_controller.dart';

@injectable
class TransactionViewController extends GetxController {
  late DateTime earliestDate;

  RxInt month = 0.obs;
  RxInt year = 0.obs;

  RxList<Transaction> expense = <Transaction>[].obs;
  RxList<Transaction> income = <Transaction>[].obs;

  GetTransactionController getController = Get.find<GetTransactionController>();

  @override
  onInit() async {
    super.onInit();
    earliestDate = await getController.repository.getEarliestTransactionDate();
  }

  getMonthlyTransaction(int month, int year) async {
    await getController.getMonthlyTransaction(month, year);
    List<Transaction> transactions = getController.transactions;
    this.month.value = month;
    this.year.value = year;
    expense.value = transactions.where((item) => item.type == 0).toList();
    income.value = transactions.where((item) => item.type == 1).toList();
  }
}
