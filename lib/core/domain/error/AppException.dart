class AlreadyAddedException implements Exception {
  final String message;
  AlreadyAddedException({required this.message});
}