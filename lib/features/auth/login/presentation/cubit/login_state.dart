import 'package:equatable/equatable.dart';

enum LoginStateValue {
  intial,
  // ignore: constant_identifier_names
  Loading,
  // ignore: constant_identifier_names
  success,
  error,
}

class LoginState extends Equatable {
  const LoginState({this.screenStatus, this.userRole, this.failures});

  final LoginStateValue? screenStatus;
  final String? userRole;
  final String? failures;

  LoginState copyWith({
    LoginStateValue? screenStatus,
    String? userRole,
    String? failures,
  }) {
    return LoginState(
      screenStatus: screenStatus ?? this.screenStatus,
      failures: failures ?? this.failures,
      userRole: userRole ?? this.userRole,
    );
  }

  @override
  List<Object?> get props => [screenStatus, userRole, failures];
}

final class LoginInitial extends LoginState {
  const LoginInitial() : super(screenStatus: LoginStateValue.intial);
}
