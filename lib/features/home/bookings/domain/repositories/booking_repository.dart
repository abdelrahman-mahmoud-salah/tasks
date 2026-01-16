import 'package:task/core/services/api_error_handler.dart';
import 'package:task/features/home/bookings/data/models/all_bookings_response_model.dart';

abstract class BookingRepository {
  Future<ApiResult<AllBookingsResponseModel>> getAllBookings();
}
