import 'package:flutter_application_1/core/services/api_error_handler.dart';
import 'package:flutter_application_1/core/services/booking_api_service.dart';
import 'package:flutter_application_1/features/home/bookings/data/data_sources/remote/booking_remote_ds.dart';
import 'package:flutter_application_1/features/home/bookings/data/models/all_bookings_response_model.dart';


class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final BookingApiService _bookingApiService;

  BookingRemoteDataSourceImpl(this._bookingApiService);

  @override
  Future<ApiResult<AllBookingsResponseModel>> getAllBookings() async {
    try {
      final result = await _bookingApiService.getAllBookings();
      final responseModel = AllBookingsResponseModel.fromJson(result);
      return ApiResult.success(responseModel);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
