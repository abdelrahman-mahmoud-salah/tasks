import 'package:task/core/services/api_error_handler.dart';
import 'package:task/features/home/add_car/data/models/add_car_request_model.dart';
import 'package:task/features/home/add_car/data/models/add_car_response_model.dart';

abstract class AddCarRemoteDataSource {
  Future<ApiResult<AddCarResponseModel>> addCar(AddCarRequestModel request);
}
