import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../../application/controller/get_transaction_controller.dart';
import '../../../application/controller/transaction_screen_controller.dart';
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
    final c1 = Get.find<GetTransactionController>();
    final c2 = Get.put(getIt<TransactionViewController>());

    c2.getMonthlyTransaction(DateTime.now().month, DateTime.now().year);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppBar(
          title: Obx(
            () => Text(
                '${DateFormat('MMMM').format(DateTime(0, c2.month.value))} ${c2.year.value}'),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showMonthPicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: c2.earliestDate,
                  lastDate: DateTime.now(),
                ).then((date) {
                  if (date != null) {
                    c2.getMonthlyTransaction(date.month, date.year);
                  }
                });
              },
              icon: const Icon(Icons.calendar_month),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              text: "Expense",
            ),
            Tab(
              text: "Income",
            ),
          ],
        ),
        Expanded(
          child: Obx(() {
            return c1.isLoading.isTrue
                ? const LoadingWidget()
                : c1.isEmpty
                    ? const EmptyTransactionWidget()
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            padding: const EdgeInsets.only(bottom: 50),
                            itemCount: c2.expense.length,
                            itemBuilder: (context, index) => TransactionCard(
                              transaction: c2.expense[index],
                            ),
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.only(bottom: 50),
                            itemCount: c2.income.length,
                            itemBuilder: (context, index) => TransactionCard(
                              transaction: c2.income[index],
                            ),
                          ),
                        ],
                      );
          }),
        ),
      ],
    );
  }
}
