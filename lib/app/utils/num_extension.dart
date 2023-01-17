import 'package:intl/intl.dart';

extension NumExt on num {
  static var formatter = NumberFormat.currency(symbol: "");
  static var digitGroupNoDecimal = NumberFormat.decimalPattern('vi_vn');

  String toMoney() {
    var result = toString();
    result = formatter.format(this);
    return "$result ₫";
  }

  String toMoneyWithoutDecimal() {
    var result = toString();
    result = digitGroupNoDecimal.format(this);
    return "$result ₫";
  }
}
