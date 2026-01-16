// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_bookings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBookingsResponseModel _$AllBookingsResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllBookingsResponseModel(
      bookings: (json['bookings'] as List<dynamic>)
          .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllBookingsResponseModelToJson(
        AllBookingsResponseModel instance) =>
    <String, dynamic>{
      'bookings': instance.bookings,
    };
