import 'package:equatable/equatable.dart';

enum AppErrorType {
  network,
  server,
  unauthorized,
  validation,
  unknown,
}

class AppError extends Equatable {
  const AppError({
    required this.type,
    this.message,
  });

  const AppError.network([this.message]) : type = AppErrorType.network;
  const AppError.server([this.message]) : type = AppErrorType.server;
  const AppError.unauthorized([this.message]) : type = AppErrorType.unauthorized;
  const AppError.validation([this.message]) : type = AppErrorType.validation;
  const AppError.unknown([this.message]) : type = AppErrorType.unknown;

  final AppErrorType type;
  final String? message;

  String get errorMessage {
    return message ??
        switch (type) {
          AppErrorType.network => 'Network error',
          AppErrorType.server => 'Server error',
          AppErrorType.unauthorized => 'Unauthorized',
          AppErrorType.validation => 'Validation error',
          AppErrorType.unknown => 'Unknown error',
        };
  }

  @override
  List<Object?> get props => [type, message];
}
