

import 'package:flutter_application_1/core/services/api_error_handler.dart';
import 'package:flutter_application_1/features/home/bookings/data/models/all_bookings_response_model.dart';

abstract class BookingRepository {
  Future<ApiResult<AllBookingsResponseModel>> getAllBookings();
}
