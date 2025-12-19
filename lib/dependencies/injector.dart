import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/pessoa_controller.dart';
import '../controllers/theme_controller.dart';
import '../services/api_client.dart';

Future<void> injector() async {
  final i = GetIt.instance;

  i.registerSingleton<Dio>(
    Dio(BaseOptions(
      baseUrl: _getBaseUrl(),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    )),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  i.registerSingleton<SharedPreferences>(sharedPreferences);

  i.registerFactory<ApiClient>(
        () => ApiClient(
      dio: i<Dio>(),
      apiUrl: '',
    ),
  );

  i.registerLazySingleton<PessoaController>(
        () => PessoaController(apiClient: i<ApiClient>()),
  );

  i.registerLazySingleton<ThemeController>(
        () => ThemeController(sharedPreferences: i<SharedPreferences>()),
  );
}

String _getBaseUrl() {
  if (kIsWeb) {
    return "http://localhost:3000";
  } else if (Platform.isAndroid) {
    return "http://10.0.2.2:3000";
  } else {
    return "http://localhost:3000";
  }
}