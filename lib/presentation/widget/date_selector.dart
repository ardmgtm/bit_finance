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
  @override
  Widget build(BuildContext context) {
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
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd MMMM yyyy').format(pickedDate);

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
