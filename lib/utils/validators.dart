import 'package:flutter_template/utils/extensions.dart';

class Validators {
  static final _emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static String? email(String? input) {
    if (input.isNullOrEmpty) return 'Vui lòng nhập Email';
    if (!_emailRegex.hasMatch(input!)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  static String? password(String? input) {
    if (input.isNullOrEmpty) return 'Vui lòng nhập mật khẩu';
    return null;
  }
}
