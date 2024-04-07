

// ignore_for_file: inference_failure_on_uninitialized_variable, prefer_typing_uninitialized_variables, type_annotate_public_apis, lines_longer_than_80_chars, eol_at_end_of_file

class AppException implements Exception {
  AppException({this.code, this.message = 'error', this.details});

  final code;
  final String message;
  final details;
}