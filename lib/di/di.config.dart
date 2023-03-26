// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_base_architecture/data/repository/local/preference/app_preferences.dart'
    as _i7;
import 'package:flutter_base_architecture/di/local_module.dart' as _i8;
import 'package:flutter_base_architecture/domain/define.dart' as _i5;
import 'package:flutter_base_architecture/domain/usecases/login_use_case.dart'
    as _i4;
import 'package:flutter_base_architecture/ui/home/home_bloc.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc());
    gh.factory<_i4.LoginUseCase>(
        () => _i4.LoginUseCase(gh<_i5.AppRepository>()));
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i7.AppPreferences>(
        () => _i7.AppPreferences(gh<_i6.SharedPreferences>()));
    return this;
  }
}

class _$InjectableModule extends _i8.InjectableModule {}
