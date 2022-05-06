import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/controller/get_transaction_controller.dart';
import '../../../injection.dart';
import '../../widget/widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    final c = Get.put(getIt<GetTransactionController>());
    c.getMonthlyTransaction(DateTime.now().month - 1, DateTime.now().year);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppBar(
          title: const Text('April 2022'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: "Expense",
            ),
            Tab(
              text: "Income",
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Obx(() {
                return c.isLoading.isTrue
                    ? const LoadingWidget()
                    : c.isEmpty
                        ? const EmptyTransactionWidget()
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 50),
                            itemCount: c.transactions.length,
                            itemBuilder: (context, index) => TransactionCard(
                              transaction: c.transactions[index],
                            ),
                          );
              }),
              Icon(Icons.ac_unit),
            ],
          ),
        ),
      ],
    );
  }
}
