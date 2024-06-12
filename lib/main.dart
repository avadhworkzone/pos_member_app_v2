import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:member_app_v2/data/remote/web_http_overrides.dart';
import 'package:member_app_v2/modules/app/view/member_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = WebHttpOverrides();
  await GetStorage.init();
  runApp(const MemberApp());
}
