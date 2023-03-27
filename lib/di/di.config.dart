// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_base_architecture/data/model/define.dart' as _i7;
import 'package:flutter_base_architecture/data/model/mapper/error_response_detail_mapper.dart'
    as _i3;
import 'package:flutter_base_architecture/data/model/mapper/error_response_mapper.dart'
    as _i4;
import 'package:flutter_base_architecture/data/repository/local/preference/app_preferences.dart'
    as _i12;
import 'package:flutter_base_architecture/data/repository/remote/api/error/http_request_exception_mapper.dart'
    as _i6;
import 'package:flutter_base_architecture/data/repository/remote/api/services/refresh_token_service.dart'
    as _i10;
import 'package:flutter_base_architecture/di/local_module.dart' as _i13;
import 'package:flutter_base_architecture/domain/define.dart' as _i9;
import 'package:flutter_base_architecture/domain/usecases/login_use_case.dart'
    as _i8;
import 'package:flutter_base_architecture/ui/home/home_bloc.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

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
    gh.factory<_i3.ErrorResponseDetailMapper>(
        () => _i3.ErrorResponseDetailMapper());
    gh.factory<_i4.ErrorResponseMapper>(
        () => _i4.ErrorResponseMapper(gh<_i3.ErrorResponseDetailMapper>()));
    gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc());
    gh.factory<_i6.HttpRequestExceptionMapper>(
        () => _i6.HttpRequestExceptionMapper(gh<_i7.ErrorResponseMapper>()));
    gh.factory<_i8.LoginUseCase>(
        () => _i8.LoginUseCase(gh<_i9.AppRepository>()));
    gh.lazySingleton<_i10.RefreshTokenService>(
        () => _i10.RefreshTokenService());
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i12.AppPreferences>(
        () => _i12.AppPreferences(gh<_i11.SharedPreferences>()));
    return this;
  }
}

class _$InjectableModule extends _i13.InjectableModule {}
