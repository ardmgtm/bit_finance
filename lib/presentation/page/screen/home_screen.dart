import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../application/controller/get_transaction_controller.dart';
import '../../../application/helper/currency_formatter.dart';
import '../../../injection.dart';
import '../../widget/transaction_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(getIt<GetTransactionController>());
    TextTheme textTheme = Theme.of(context).textTheme;
    c.getMonthlyTransaction(DateTime.now().month, DateTime.now().year);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Monthly Balance,",
                  style: textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => Text(
                    CurrencyFormatter.format(c.balance.value),
                    style: textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_circle_down_outlined,
                                color: Colors.green[600],
                                size: 16.0,
                              ),
                              Text(
                                "Income",
                                style: textTheme.bodyText1!.copyWith(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  CurrencyFormatter.format(c.income.value),
                                  style: textTheme.bodyText1!.copyWith(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.grey[300],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_circle_up_outlined,
                                color: Colors.red[600],
                                size: 16.0,
                              ),
                              Text(
                                "Expense",
                                style: textTheme.bodyText1!.copyWith(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  CurrencyFormatter.format(c.expense.value),
                                  style: textTheme.bodyText1!.copyWith(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Recent Transaction",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () => c.isLoading.value
              ? const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : c.recentTransactions.isEmpty
                  ? Expanded(
                      child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(
                              Icons.file_copy,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          Text(
                            "Empty Transaction !",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ))
                  : Expanded(
                      child: ListView.separated(
                        itemCount: c.recentTransactions.length,
                        separatorBuilder: (_, i) => const SizedBox(),
                        itemBuilder: (context, i) => TransactionCard(
                          transaction: c.recentTransactions[i],
                        ),
                      ),
                    ),
        ),
      ],
    );
  }
}
