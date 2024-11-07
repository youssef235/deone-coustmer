import 'package:firebase_core/firebase_core.dart';
import 'package:wasq/utils/hive_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/notifications_handler.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await EasyLocalization.ensureInitialized();
  await HiveManager.initHive();


  await NotificationsHandler().init();

  runApp(const RootApp());
}
