import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_car_response_model.g.dart';

@JsonSerializable()
class AddCarResponseModel extends Equatable {
  const AddCarResponseModel({
    this.status,
    this.message,
  });

  factory AddCarResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddCarResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCarResponseModelToJson(this);

  final int? status;
  final String? message;

  @override
  List<Object?> get props => [status, message];
}
