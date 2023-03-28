import 'dart:async';
import 'dart:ui';

import 'package:flutter_base_architecture/data/model/define.dart';
import 'package:flutter_base_architecture/domain/usecases/define.dart';
import 'package:flutter_base_architecture/util/extensions/define.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../base/define.dart';

@Injectable()
class HomeBloc extends BaseBloc {
  final GPTRequestUseCase _gptRequestUseCase;

  final _countSubject = BehaviorSubject<int>();
  int count = 0;

  // Input
  late VoidCallback funcClick;

  StreamSink<int> get _streamCountOut => _countSubject.sink;

  // Output
  Stream<int> get streamCount => _countSubject.stream;

  HomeBloc(this._gptRequestUseCase) {
    final clickController = PublishSubject<void>()..disposeBy(disposeBag);

    funcClick = () => _gptRequest("20 từ vựng tiếng anh toiec");

    clickController.stream.listen((value) {
      _streamCountOut.add(count++);
    });
  }

  Stream<List<ChoiceData>> _gptRequest(String content) =>
      executeFuture(_gptRequestUseCase
          .call(GPTRequestInput(content)));
}
