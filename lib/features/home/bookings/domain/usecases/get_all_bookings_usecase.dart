

import 'package:flutter_application_1/core/services/api_error_handler.dart';
import 'package:flutter_application_1/features/home/bookings/data/models/all_bookings_response_model.dart';
import 'package:flutter_application_1/features/home/bookings/domain/repositories/booking_repository.dart';

class GetAllBookingsUseCase {
  final BookingRepository _bookingRepository;

  GetAllBookingsUseCase(this._bookingRepository);

  Future<ApiResult<AllBookingsResponseModel>> call() async {
    return await _bookingRepository.getAllBookings();
  }
}
