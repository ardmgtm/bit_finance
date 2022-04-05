import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../application/constants/category_data.dart';
import '../../application/helper/currency_formatter.dart';
import '../../domain/entity/category/category.dart';
import '../../domain/entity/transaction/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Category _category = transaction.type == 0
        ? expenseCategories[transaction.category]
        : incomeCategories[transaction.category];

    Color _color =
        transaction.type == 0 ? Colors.red[600]! : Colors.green[600]!;

    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: _color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconTheme(
              child: _category.icon,
              data: IconThemeData(color: _color),
            )),
      ),
      title: Text(
        _category.name,
        style: TextStyle(
          // color: Theme.of(context).colorScheme.primary,
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(transaction.description),
          Text(DateFormat('dd MMM, hh:mm a').format(transaction.dateTime)),
        ],
      ),
      trailing: Text(
        (transaction.type == 0 ? '-' : '+') +
            CurrencyFormatter.format(transaction.nominal),
        style: TextStyle(
          color: transaction.type == 0 ? Colors.red[600] : Colors.green[600],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
