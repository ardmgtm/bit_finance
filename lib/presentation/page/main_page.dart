import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/constants/routes.dart';
import '../../application/controller/main_page_controller.dart';
import '../../injection.dart';
import '../widget/widget.dart';
import 'screen/home_screen.dart';
import 'screen/transaction_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomeScreen(),
      const TransactionScreen(),
      Icon(Icons.auto_graph),
      Icon(Icons.settings),
    ];
    MainPageController mainPageController =
        Get.put(getIt<MainPageController>());

    return Scaffold(
      body: Obx(() => pages.elementAt(mainPageController.index.value)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(BitFinanceRoutes.addTransaction)
              // ?.then(
              //   (value) => c.getMonthlyTransaction(
              //       DateTime.now().month, DateTime.now().year),
              // )
              ;
        },
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        onItemMenuSelected: (i) {
          mainPageController.switchScreen(i);
        },
      ),
    );
  }
}
