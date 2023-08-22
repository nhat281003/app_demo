import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Được tạo bởi Phạm Nhớ từ 16/09/2022
/// mọi hành vi sao chép cần được sự cho phép

class ThousandsDecimalInputFormatter extends TextInputFormatter {
  static final NumberFormat _formatter = NumberFormat.decimalPattern();

  final FilteringTextInputFormatter _decimalFormatter;
  final String _decimalSeparator;
  final RegExp _decimalRegex;

  final NumberFormat? formatter;
  final bool allowFraction;
  TextEditingValue? _lastNewValue;

  ThousandsDecimalInputFormatter({this.formatter, this.allowFraction = false})
      : _decimalSeparator = (formatter ?? _formatter).symbols.DECIMAL_SEP,
        _decimalRegex = RegExp(allowFraction ? '[0-9]+([${(formatter ?? _formatter).symbols.DECIMAL_SEP}])?' : r'\d+'),
        _decimalFormatter = FilteringTextInputFormatter.allow(RegExp(allowFraction ? '[0-9]+([${(formatter ?? _formatter).symbols.DECIMAL_SEP}])?' : r'\d+'));

  String _formatPattern(String digits) {
    if (digits.isEmpty) return digits;
    num number;
    if (allowFraction) {
      String decimalDigits = digits;
      if (_decimalSeparator != '.') {
        decimalDigits = digits.replaceFirst(RegExp(_decimalSeparator), '.');
      }
      number = double.tryParse(decimalDigits) ?? 0.0;
    } else {
      number = int.tryParse(digits) ?? 0;
    }
    final result = (formatter ?? _formatter).format(number);
    if (allowFraction && digits.endsWith(_decimalSeparator)) {
      return '$result$_decimalSeparator';
    }

    if (digits.contains('.')) {
      List<String> decimalPlacesValue = digits.split(".");
      String decimalOnly = decimalPlacesValue[1];
      double? digitsOnly = double.tryParse(decimalPlacesValue[0]);
      String result = (formatter ?? _formatter).format(digitsOnly);
      result = result + '.' + decimalOnly;
      return result;
    }
    return result;
  }

  TextEditingValue _formatValue(TextEditingValue oldValue, TextEditingValue newValue) {
    return _decimalFormatter.formatEditUpdate(oldValue, newValue);
  }

  bool _isUserInput(String s) {
    return s == _decimalSeparator || _decimalRegex.firstMatch(s) != null;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == _lastNewValue?.text) {
      return newValue;
    }
    _lastNewValue = newValue;

    newValue = _formatValue(oldValue, newValue);
    int selectionIndex = newValue.selection.end;

    final newText = _formatPattern(newValue.text);

    int insertCount = 0;

    int inputCount = 0;
    for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    if (selectionIndex - 1 >= 0 && selectionIndex - 1 < newText.length && !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: selectionIndex), composing: TextRange.empty);
  }
}

class DecimalRangeInputFormatter extends TextInputFormatter {
  DecimalRangeInputFormatter({required this.decimalRange}) : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value = newValue.text;

    if (value.contains(".") && value.substring(value.indexOf(".") + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      truncated = "0.";

      newSelection = newValue.selection.copyWith(
        baseOffset: min(truncated.length, truncated.length + 1),
        extentOffset: min(truncated.length, truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}
