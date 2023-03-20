// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

abstract class Failure {
  final String message;
  final StackTrace? stackTrace;
  final String? label;

  Failure({required this.message, this.stackTrace, this.label}) {
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace, label: label);
    }
  }

  @override
  String toString() => '$runtimeType: $message';
}

class DataSourceException extends Failure {
  DataSourceException({
    required final String message,
    final StackTrace? stackTrace,
    final String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

class NetworkException extends Failure {
  final dynamic data;
  NetworkException({
    required final String message,
    final StackTrace? stackTrace,
    final String? label,
    this.data,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}
