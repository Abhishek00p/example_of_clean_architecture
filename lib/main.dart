import 'package:flutter/material.dart';
import 'package:societymanager/core/app/app.dart';
import 'package:societymanager/core/config/config_reader.dart';
import 'package:societymanager/core/injectable_modules/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  configureDeps();
  runApp(const App());
}
