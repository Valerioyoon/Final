import 'package:day35/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main () async {
  await GetStorage.init();

  runApp(GetMaterialApp(
    home: StartPage(),
    debugShowCheckedModeBanner: false,
  ));
}
