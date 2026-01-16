import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../network/api_constants.dart';

part 'booking_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.mobileCabPartnerBaseUrl)
abstract class BookingApiService {
  factory BookingApiService(Dio dio, {String baseUrl}) = _BookingApiService;

  @GET(ApiConstants.allBookings)
  Future<dynamic> getAllBookings();
}


