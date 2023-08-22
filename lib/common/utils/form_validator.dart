import 'package:intl/intl.dart';
class FormValidator {
  const FormValidator._privateConstructor();

  static const FormValidator _instance = FormValidator._privateConstructor();

  static FormValidator get instance => _instance;

  bool isValidTextInput(String text) {
    bool check = text.isNotEmpty;
    return check;
  }

  bool isCheckInteger(String string) {
    final numericRegex = RegExp(r'^(([0-9]*))$');
    return numericRegex.hasMatch(string);
  }

  String convertValueBigOneThousand(int value) {
    final NumberFormat _numberFormat = NumberFormat.decimalPattern('en_us');
    if (value.abs() > 999) {
      return _numberFormat.format(value);
    } else {
      return value.toString();
    }
  }

  String convertValueDoubleBigOneThousand(double value) {
    final NumberFormat _numberFormat = NumberFormat.decimalPattern('en_us');
    if (value.abs() > 999) {
      return _numberFormat.format(value);
    } else {
      return value.toString();
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  bool checkDateTimeMessage(String date) {
    var outputFormat = DateFormat('yyyy/MM/dd');
    var dateNow = outputFormat.format(DateTime.now());
    if (date == dateNow) {
      return true;
    }
    return false;
  }

  bool isCheckTextLanguageEu(String string) {
    final stringRegex = RegExp(r'^[A-Za-z0-9_.]+$');
    return stringRegex.hasMatch(string);
  }
}
