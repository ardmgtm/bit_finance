import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final TextEditingController controller;

  const DateSelector({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text = _formatDate(DateTime.now());

    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: 'Select Date',
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: const Icon(Icons.date_range_outlined),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          String formattedDate = _formatDate(pickedDate);

          setState(() {
            widget.controller.text = formattedDate;
          });
        } else {
          debugPrint("Date is not selected");
        }
      },
    );
  }
}
