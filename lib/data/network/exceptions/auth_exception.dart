import 'package:let_tutor/utils/extensions/string_ext.dart';

import 'network_exception.dart';

class AuthException extends NetworkException {
  AuthException({message, statusCode})
      : super(message: message, statusCode: statusCode);

  String get description {
    return message ?? 'unknown_error'.translate;
  }
}
