import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_car_request_model.g.dart';

@JsonSerializable()
class AddCarRequestModel extends Equatable {
  const AddCarRequestModel({
    required this.userId,
    required this.carType,
    required this.plateNo,
    required this.ssno,
  });

  factory AddCarRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddCarRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCarRequestModelToJson(this);

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'car_type')
  final String carType;

  @JsonKey(name: 'plate_no')
  final String plateNo;

  final String ssno;

  @override
  List<Object?> get props => [userId, carType, plateNo, ssno];
}
