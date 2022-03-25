import 'package:bit_finance/presentation/page/add_transaction_page.dart';
import 'package:get/get.dart';

import '../presentation/page/home_page.dart';

class BitFinanceRoutes {
  static const home = '/';
  static const addTransaction = '/add-transaction';

  static List<GetPage<dynamic>> pages() {
    return [
      GetPage(name: home, page: () => const HomePage()),
      GetPage(name: addTransaction, page: () => const AddTransactionPage()),
    ];
  }
}
