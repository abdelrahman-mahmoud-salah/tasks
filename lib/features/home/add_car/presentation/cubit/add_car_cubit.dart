import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/add_car/data/models/add_car_request_model.dart';

import 'package:task/features/home/add_car/domain/usecases/add_car_usecase.dart';
import 'package:task/features/home/add_car/presentation/cubit/add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  AddCarCubit(this._addCarUseCase) : super(const AddCarInitial());

  TextEditingController carTypeController = TextEditingController();
  TextEditingController plateNoController = TextEditingController();
  TextEditingController ssnoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AddCarUseCase _addCarUseCase;
  Future<void> addCar(String userId) async {
    emit(state.copyWith(screenStatus: AddCarStateValue.loading));

    var request = AddCarRequestModel(
      userId: userId,
      carType: carTypeController.text,
      plateNo: plateNoController.text,
      ssno: ssnoController.text,
    );

    var result = await _addCarUseCase.call(request);

    result.when(
      success: (data) {
        emit(state.copyWith(screenStatus: AddCarStateValue.success));
        // Clear form
        carTypeController.clear();
        plateNoController.clear();
        ssnoController.clear();
      },
      failure: (errorHandler) {
        emit(
          state.copyWith(
            screenStatus: AddCarStateValue.error,
            failures: errorHandler,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    carTypeController.dispose();
    plateNoController.dispose();
    ssnoController.dispose();
    return super.close();
  }
}
