import 'package:task/core/services/api_error_handler.dart';
import 'package:task/features/home/bookings/data/data_sources/remote/booking_remote_ds.dart';
import 'package:task/features/home/bookings/data/models/all_bookings_response_model.dart';
import 'package:task/features/home/bookings/domain/repositories/booking_repository.dart';

class BookingRepoImpl implements BookingRepository {
  final BookingRemoteDataSource _bookingDataSource;

  BookingRepoImpl(this._bookingDataSource);

  @override
  Future<ApiResult<AllBookingsResponseModel>> getAllBookings() =>
      _bookingDataSource.getAllBookings();
}
