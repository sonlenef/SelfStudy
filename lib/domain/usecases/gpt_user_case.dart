import 'package:injectable/injectable.dart';

import '../../data/model/define.dart';
import '../define.dart';
import 'define.dart';

@Injectable()
class GPTRequestUseCase extends BaseUseCase<GPTRequestInput, List<ChoiceData>> {
  final AppRepository _repository;

  GPTRequestUseCase(this._repository);

  @override
  Future<List<ChoiceData>> call(GPTRequestInput input) {
    return _repository.gptRequest(content: input.content);
  }
}
