import 'package:get/get.dart';

import '../presentation/page/home_page.dart';

class BitFinanceRoutes {
  static const home = '/';

  static List<GetPage<dynamic>> pages() {
    return [
      GetPage(name: home, page: () => const HomePage()),
    ];
  }
}
