import 'package:bit_finance/application/controller/get_transaction_controller.dart';
import 'package:bit_finance/application/controller/main_page_controller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../application/constants/category_data.dart';
import '../../../application/controller/add_transaction_controller.dart';
import '../../../domain/entity/transaction/transaction.dart';
import '../../../injection.dart';
import '../../widget/widget.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(getIt<AddTransactionController>());
    GetTransactionController c2 = Get.find();

    TextEditingController _nominalInput = TextEditingController();
    TextEditingController _dateInput = TextEditingController();
    TextEditingController _timeInput = TextEditingController();
    TextEditingController _descriptionInput = TextEditingController();

    CategorySelectController _categorySelect = CategorySelectController();
    CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text(
            'Nominal',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nominalInput,
            keyboardType: TextInputType.number,
            inputFormatters: [_formatter],
            decoration: InputDecoration(
                hintText: 'Enter Nominal',
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
          ),
          const SizedBox(height: 8),
          const Text(
            'Date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          DateSelector(controller: _dateInput),
          const SizedBox(height: 8),
          const Text(
            'Time',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          TimeSelector(controller: _timeInput),
          const SizedBox(height: 8),
          const Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          CategorySelector(
            categoryList: expenseCategories,
            controller: _categorySelect,
          ),
          const SizedBox(height: 8),
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _descriptionInput,
            style: const TextStyle(fontSize: 16),
            maxLength: 20,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.00),
          ElevatedButton(
            onPressed: () async {
              var transaction = Transaction(
                type: 0,
                nominal: _formatter.getUnformattedValue().toDouble(),
                dateTime: DateFormat('dd/MM/yyyy hh:mm a')
                    .parse(_dateInput.text + " " + _timeInput.text),
                category: _categorySelect.index ?? 0,
                description: _descriptionInput.text,
              );
              debugPrint(transaction.toJson().toString());
              await controller.createTransaction(transaction);
              await c2.getMonthlyTransaction(
                DateTime.now().month,
                DateTime.now().year,
              );
              debugPrint(controller.isError.toString());
              if (controller.isError.isFalse) {
                Get.back();
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Save Expense'),
            ),
          )
        ],
      ),
    );
  }
}
