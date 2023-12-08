// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:societymanager/core/injectable_modules/hive_module.dart' as _i8;
import 'package:societymanager/core/injectable_modules/looger_module.dart'
    as _i9;
import 'package:societymanager/core/injectable_modules/network_module.dart'
    as _i7;
import 'package:societymanager/core/logger/app_logger.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkInjectableModule = _$NetworkInjectableModule();
    final hiveInjectableModule = _$HiveInjectableModule();
    final loggerInjectableModule = _$LoggerInjectableModule();
    gh.lazySingleton<_i3.Client>(() => networkInjectableModule.client);
    gh.lazySingleton<_i4.HiveInterface>(() => hiveInjectableModule.hive);
    gh.lazySingleton<_i5.Logger>(() => loggerInjectableModule.logger);
    gh.lazySingleton<_i6.AppLogger>(() => _i6.AppLoggerImpl(gh<_i5.Logger>()));
    return this;
  }
}

class _$NetworkInjectableModule extends _i7.NetworkInjectableModule {}

class _$HiveInjectableModule extends _i8.HiveInjectableModule {}

class _$LoggerInjectableModule extends _i9.LoggerInjectableModule {}
