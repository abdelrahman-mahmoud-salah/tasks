

import 'package:flutter_application_1/core/services/api_error_handler.dart';
import 'package:flutter_application_1/features/home/add_car/data/models/add_car_request_model.dart';
import 'package:flutter_application_1/features/home/add_car/data/models/add_car_response_model.dart';

abstract class AddCarRepository {
  Future<ApiResult<AddCarResponseModel>> addCar(AddCarRequestModel request);
}
