import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/features/home/add_car/data/models/add_car_request_model.dart';
import 'package:task/features/home/add_car/data/models/add_car_response_model.dart';

import '../network/api_constants.dart';
import '../../features/auth/login/data/models/login_request_model.dart';
import '../../features/auth/login/data/models/login_response_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);
  
   @POST(ApiConstants.addCars)
  Future<AddCarResponseModel> addCar(@Body() AddCarRequestModel body);
}
