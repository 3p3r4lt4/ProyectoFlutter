import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {

  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if(newValue.selection.baseOffset == 0) return newValue;

  double value = double.parse(newValue.text);

  final formatter = new NumberFormat("#,##0.00");

  String newText = formatter.format(value/100);
  
  return newValue.copyWith(
      text: newText,
      selection: new TextSelection.collapsed(offset: newText.length));
    }
  }