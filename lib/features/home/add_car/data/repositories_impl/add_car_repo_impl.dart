import 'package:task/core/services/api_error_handler.dart';
import 'package:task/features/home/add_car/data/data_sources/remote/add_car_remote_ds.dart';
import 'package:task/features/home/add_car/data/models/add_car_request_model.dart';
import 'package:task/features/home/add_car/data/models/add_car_response_model.dart';
import 'package:task/features/home/add_car/domain/repositories/add_car_repository.dart';

class AddCarRepoImpl implements AddCarRepository {
  final AddCarRemoteDataSource _addCarDataSource;

  AddCarRepoImpl(this._addCarDataSource);

  @override
  Future<ApiResult<AddCarResponseModel>> addCar(AddCarRequestModel request) =>
      _addCarDataSource.addCar(request);
}
