import 'package:connect_erp/RunApp.dart';
import 'package:flutter/material.dart';
import 'classess/notification/notiification_config.dart';

final navigatiorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ConfigureNotification onNotification = ConfigureNotification();
  onNotification.inicializeNotification();

  runApp(const RunApp());
}
