// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String LOGIN = '/login';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case LOGIN:
      //   final args = settings.arguments as LoginArguments?;
      //   return MaterialPageRoute(
      //       settings: settings, builder: (ctx) => LoginPage(arguments: args));
      default:
        return null;
    }
  }
}
