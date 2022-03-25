import 'package:flutter/material.dart';

import 'screen/add_expense_screen.dart';
import 'screen/add_income_screen.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Transaction'),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size(200.0, 60.0),
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        indicatorColor: Colors.white,
                        indicatorWeight: 0,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(text: 'Expense'),
                          Tab(text: 'Income'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.grey[100],
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AddExpenseScreen(),
              AddIncomeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
