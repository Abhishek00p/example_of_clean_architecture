import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:societymanager/core/injectable_modules/injection_container.config.dart';

final di = GetIt.I;

@InjectableInit()
void configureDeps() {
  di.init();
}

Future<void> configureHiveBoxes() async {
  await Hive.initFlutter();

  await Hive.openBox<dynamic>(
    "userBox",
  );
}
