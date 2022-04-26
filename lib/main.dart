import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/controllers/api_service.dart';
import 'src/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  final apiService = Get.put(ApiService());
  await apiService.startApp();
  runApp(const MainApp());
}
