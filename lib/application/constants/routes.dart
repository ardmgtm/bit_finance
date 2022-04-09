import 'package:get/get.dart';

import '../../presentation/page/add_transaction_page.dart';
import '../../presentation/page/main_page.dart';

class BitFinanceRoutes {
  static const main = '/';
  static const addTransaction = '/add-transaction';

  static List<GetPage<dynamic>> pages() {
    return [
      GetPage(name: main, page: () => const MainPage()),
      GetPage(name: addTransaction, page: () => const AddTransactionPage()),
    ];
  }
}
