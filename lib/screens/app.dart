import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/utils/routes.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      onGenerateRoute: Routes.onGenerateRoute,
      // initialRoute: Routes.LOGIN,
      builder: EasyLoading.init(),
    );
  }
}
