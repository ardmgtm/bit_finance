import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  final TextEditingController controller;

  const TimeSelector({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = TimeOfDay.now().format(context);

    return TextFormField(
      controller: controller,
      readOnly: true,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: 'Select Time',
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: const Icon(Icons.access_time),
      ),
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          String formattedTime = pickedTime.format(context);

          controller.text = formattedTime;
        } else {
          debugPrint("Date is not selected");
        }
      },
    );
  }
}
