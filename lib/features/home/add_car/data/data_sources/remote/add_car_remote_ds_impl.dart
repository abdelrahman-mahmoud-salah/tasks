import 'package:task/core/services/api_error_handler.dart';
import 'package:task/core/services/auth_api_service.dart';

import 'package:task/features/home/add_car/data/data_sources/remote/add_car_remote_ds.dart';
import 'package:task/features/home/add_car/data/models/add_car_request_model.dart';
import 'package:task/features/home/add_car/data/models/add_car_response_model.dart';

class AddCarRemoteDataSourceImpl implements AddCarRemoteDataSource {
  final AuthApiService _carApiService;

  AddCarRemoteDataSourceImpl(this._carApiService);

  @override
  Future<ApiResult<AddCarResponseModel>> addCar(AddCarRequestModel request) async {
    try {
      final result = await _carApiService.addCar(request);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
