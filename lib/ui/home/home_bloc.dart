import 'dart:async';
import 'dart:ui';

import 'package:flutter_base_architecture/data/model/define.dart';
import 'package:flutter_base_architecture/domain/usecases/define.dart';
import 'package:flutter_base_architecture/ui/home/enum/quantity.dart';
import 'package:flutter_base_architecture/util/extensions/define.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../base/define.dart';
import 'enum/form_type.dart';

@Injectable()
class HomeBloc extends BaseBloc {
  final GPTRequestUseCase _gptRequestUseCase;

  final _formTypeSubject = BehaviorSubject<FormType>();
  final _quantitySubject = BehaviorSubject<Quantity>();
  int count = 0;

  // Input
  late Function(FormType type) formTypeSelection;
  late Function(Quantity qty) quantitySelection;
  late void Function(String) funcTopicChanged;
  late VoidCallback funcSubmit;

  StreamSink<FormType> get _streamFormTypeOut => _formTypeSubject.sink;

  StreamSink<Quantity> get _streamQtyOut => _quantitySubject.sink;

  // Output
  Stream<FormType> get streamFormType => _formTypeSubject.stream;

  Stream<Quantity> get streamQty => _quantitySubject.stream;

  late Stream<String?> streamError;

  late Stream<bool> streamIsButtonSubmitEnable;

  late Stream<List<ChoiceData>?> streamSubmitSuccess;

  HomeBloc(this._gptRequestUseCase) {
    final formTypeSelectController = BehaviorSubject<FormType>()
      ..disposeBy(disposeBag);
    final quantitySelectController = BehaviorSubject<Quantity>()
      ..disposeBy(disposeBag);
    final topicController = BehaviorSubject.seeded("")..disposeBy(disposeBag);
    final submitController = PublishSubject<void>()..disposeBy(disposeBag);
    final onServerErrorController = PublishSubject<String?>()
      ..disposeBy(disposeBag);

    formTypeSelection = (FormType type) => formTypeSelectController.add(type);
    quantitySelection = (Quantity qty) => quantitySelectController.add(qty);
    funcTopicChanged = topicController.add;
    funcSubmit = () => submitController.add(null);

    formTypeSelectController.stream.listen((value) {
      _streamFormTypeOut.add(value);
    });

    quantitySelectController.stream.listen((value) {
      _streamQtyOut.add(value);
    });

    final Stream<String?> validationError = submitController.stream.map((_) {
      // topic validation
      if (topicController.value.isEmpty) {
        return "Wrong topic!";
      }
      return null;
    });

    streamIsButtonSubmitEnable = topicController.stream.map((value) {
      return value.isNotEmpty;
    });

    streamError = Rx.merge([
      onServerErrorController.stream,
      validationError,
      streamIsButtonSubmitEnable.mapTo(null),
    ]);

    streamSubmitSuccess = validationError.flatMap((String? error) {
      if (error == null) {
        return _gptRequest(
            "${quantitySelectController.value.label} ${topicController.value} ${formTypeSelectController.value.label}");
      } else {
        return const Stream.empty();
      }
    });

    streamSubmitSuccess.listen((List<ChoiceData>? data) {
      if (data != null) {
        for (var choiceData in data) {
          String myString = choiceData.message.content;

          List<String> categories = myString.split('\n\n');

          List<List<String>> wordLists = [];

          for (String category in categories) {
            List<String> categoryList = category.split(': ')[1].split(',').map((word) => word.trim()).toList();
            wordLists.add(categoryList);
          }

          print(wordLists);
        }
      }
    });
  }

  Stream<List<ChoiceData>> _gptRequest(String content) =>
      executeFuture(_gptRequestUseCase.call(GPTRequestInput(content)));
}
