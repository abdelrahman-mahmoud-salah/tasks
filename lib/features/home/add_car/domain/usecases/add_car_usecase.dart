import 'package:task/core/services/api_error_handler.dart';
import 'package:task/features/home/add_car/data/models/add_car_request_model.dart';
import 'package:task/features/home/add_car/data/models/add_car_response_model.dart';
import 'package:task/features/home/add_car/domain/repositories/add_car_repository.dart';

class AddCarUseCase {
  final AddCarRepository _addCarRepository;

  AddCarUseCase(this._addCarRepository);

  Future<ApiResult<AddCarResponseModel>> call(AddCarRequestModel request) async {
    return await _addCarRepository.addCar(request);
  }
}
