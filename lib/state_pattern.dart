abstract class MyPageStatePattern {}

class LoadingPageState extends MyPageStatePattern {}

class ErrorPageState extends MyPageStatePattern {
  final String message;

  ErrorPageState({required this.message});
}

class SuccessPageState extends MyPageStatePattern {
  final List<String> names;

  SuccessPageState({
    required this.names,
  });
}
