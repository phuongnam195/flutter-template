import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/di/service_locator.dart';
import 'package:flutter_template/screens/app.dart';
import 'package:flutter_template/utils/dialog_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  await setupLocator();
  DialogUtils.setupLoading();

  runApp(const App());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
