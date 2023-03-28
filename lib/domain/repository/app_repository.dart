import '../../data/model/define.dart';

abstract class AppRepository {
  Future<bool> saveIsDarkMode(bool isDarkMode);

  bool get isDarkMode;

  Future<List<ChoiceData>> gptRequest({required String content});
}
