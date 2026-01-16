import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/home/bookings/data/models/booking_model.dart';


enum BookingStateValue {
  initial,
  loading,
  success,
  error,
}

class BookingState extends Equatable {
  const BookingState({
    this.screenStatus,
    this.bookings,
    this.failures,
  });

  final BookingStateValue? screenStatus;
  final List<BookingModel>? bookings;
  final String? failures;

  BookingState copyWith({
    BookingStateValue? screenStatus,
    List<BookingModel>? bookings,
    String? failures,
  }) {
    return BookingState(
      screenStatus: screenStatus ?? this.screenStatus,
      bookings: bookings ?? this.bookings,
      failures: failures ?? this.failures,
    );
  }

  @override
  List<Object?> get props => [screenStatus, bookings, failures];
}

final class BookingInitial extends BookingState {
  const BookingInitial() : super(screenStatus: BookingStateValue.initial);
}
