import 'package:equatable/equatable.dart';

enum AddCarStateValue {
  initial,
  loading,
  success,
  error,
}

class AddCarState extends Equatable {
  const AddCarState({
    this.screenStatus,
    this.failures,
  });

  final AddCarStateValue? screenStatus;
  final String? failures;

  AddCarState copyWith({
    AddCarStateValue? screenStatus,
    String? failures,
  }) {
    return AddCarState(
      screenStatus: screenStatus ?? this.screenStatus,
      failures: failures ?? this.failures,
    );
  }

  @override
  List<Object?> get props => [screenStatus, failures];
}

final class AddCarInitial extends AddCarState {
  const AddCarInitial() : super(screenStatus: AddCarStateValue.initial);
}
