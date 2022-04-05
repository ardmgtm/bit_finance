import 'package:flutter/services.dart';
import "package:intl/intl.dart";

class CurrencyFormatter {
  static final NumberFormat _formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
      customPattern: '\u00A4 #,###');
  static NumberFormat get formatter => _formatter;

  static final NumberFormat _compactFormatter = NumberFormat.compactCurrency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static String format(double number, {bool autoCompact = false}) {
    String convert = '';
    if (autoCompact == true && number > 999999) {
      convert = _compactFormatter.format(number);
    } else {
      convert = _formatter.format(number);
    }
    return convert;
  }

  static double parse(String formattedNum) {
    var number = double.parse(formattedNum.replaceAll(RegExp('[^0-9]'), ''));
    return number;
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;

      final f = CurrencyFormatter.formatter;
      final number = CurrencyFormatter.parse(newValue.text);
      final newString = f.format(number);

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
