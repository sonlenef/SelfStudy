import 'package:injectable/injectable.dart';

import '../../../domain/define.dart';
import '../define.dart';

@Injectable()
class UserDataMapper extends DataMapper<UserData, User> {
  @override
  User mapToEntity(UserData data) {
    return User(1, data.tendn);
  }
}
