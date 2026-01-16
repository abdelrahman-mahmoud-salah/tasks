import 'package:flutter_application_1/features/home/bookings/presentation/cubit/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/home/bookings/domain/usecases/get_all_bookings_usecase.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._getAllBookingsUseCase) : super(const BookingInitial());
  final GetAllBookingsUseCase _getAllBookingsUseCase;
  Future<void> getAllBookings() async {
    emit(state.copyWith(screenStatus: BookingStateValue.loading));

 
    var result = await _getAllBookingsUseCase.call();

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            screenStatus: BookingStateValue.success,
            bookings: data.bookings,
          ),
        );
      },
      failure: (errorHandler) {
        emit(
          state.copyWith(
            screenStatus: BookingStateValue.error,
            failures: errorHandler,
          ),
        );
      },
    );
  }
}
