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
import 'package:flutter_base_architecture/data/model/mapper/user_data_mapper.dart'
    as _i10;
import 'package:flutter_base_architecture/data/repository/local/define.dart'
    as _i13;
import 'package:flutter_base_architecture/data/repository/local/local_data_source.dart'
    as _i12;
import 'package:flutter_base_architecture/data/repository/local/preference/app_preferences.dart'
    as _i11;
import 'package:flutter_base_architecture/data/repository/remote/api/error/http_request_exception_mapper.dart'
    as _i6;
import 'package:flutter_base_architecture/data/repository/remote/api/services/gpt_service.dart'
    as _i5;
import 'package:flutter_base_architecture/data/repository/remote/remote_data_source.dart'
    as _i8;
import 'package:flutter_base_architecture/data/repository/repository_impl.dart'
    as _i15;
import 'package:flutter_base_architecture/di/local_module.dart' as _i19;
import 'package:flutter_base_architecture/domain/define.dart' as _i14;
import 'package:flutter_base_architecture/domain/usecases/define.dart' as _i18;
import 'package:flutter_base_architecture/domain/usecases/gpt_user_case.dart'
    as _i16;
import 'package:flutter_base_architecture/ui/home/home_bloc.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

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
    gh.lazySingleton<_i5.GPTService>(() => _i5.GPTService());
    gh.factory<_i6.HttpRequestExceptionMapper>(
        () => _i6.HttpRequestExceptionMapper(gh<_i7.ErrorResponseMapper>()));
    gh.lazySingleton<_i8.RemoteDataSource>(
        () => _i8.RemoteDataSource(gh<_i5.GPTService>()));
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.UserDataMapper>(() => _i10.UserDataMapper());
    gh.lazySingleton<_i11.AppPreferences>(
        () => _i11.AppPreferences(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i12.LocalDataSource>(
        () => _i12.LocalDataSource(gh<_i13.AppPreferences>()));
    gh.lazySingleton<_i14.AppRepository>(() => _i15.RepositoryImpl(
          gh<_i13.LocalDataSource>(),
          gh<_i8.RemoteDataSource>(),
        ));
    gh.factory<_i16.GPTRequestUseCase>(
        () => _i16.GPTRequestUseCase(gh<_i14.AppRepository>()));
    gh.factory<_i17.HomeBloc>(
        () => _i17.HomeBloc(gh<_i18.GPTRequestUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i19.InjectableModule {}
