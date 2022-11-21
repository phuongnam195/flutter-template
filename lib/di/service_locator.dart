import 'package:dio/dio.dart';
import 'package:flutter_template/data/local/shared_preference_helper.dart';
import 'package:flutter_template/data/network/api_client.dart';
import 'package:flutter_template/di/module/network_module.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'module/local_module.dart';

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  // getIt.registerFactory(() => ErrorStore());
  // getIt.registerFactory(() => FormStore());

  // async singletons:----------------------------------------------------------
  // getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  Get.putAsync<SharedPreferences>(
      () async => await LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  Get.put<SharedPreferenceHelper>(SharedPreferenceHelper(Get.find()));
  Get.put<Dio>(NetworkModule.provideDio(Get.find()));
  Get.put<ApiClient>(ApiClient(Get.find()));
}
