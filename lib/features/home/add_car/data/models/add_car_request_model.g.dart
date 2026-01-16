// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_car_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCarRequestModel _$AddCarRequestModelFromJson(Map<String, dynamic> json) =>
    AddCarRequestModel(
      userId: json['user_id'] as String,
      carType: json['car_type'] as String,
      plateNo: json['plate_no'] as String,
      ssno: json['ssno'] as String,
    );

Map<String, dynamic> _$AddCarRequestModelToJson(AddCarRequestModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'car_type': instance.carType,
      'plate_no': instance.plateNo,
      'ssno': instance.ssno,
    };
