import 'package:injectable/injectable.dart';
import 'package:tuple/tuple.dart';

import '../../../domain/define.dart';
import '../../model/define.dart';
import 'api/services/user_service.dart';

@LazySingleton()
class RemoteDataSource {
  final UserService _userService;
  final UserDataMapper _remoteUserDataMapper;

  RemoteDataSource(this._userService, this._remoteUserDataMapper);

  Future<Tuple2<String, User>> login(String username, String password) async {
    final response = await _userService.login(username, password);
    return Tuple2(response.data.accessToken,
        _remoteUserDataMapper.mapToEntity(response.data.user));
  }
}
