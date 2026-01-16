// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: (json['id'] as num?)?.toInt(),
      bookingId: json['booking_id'] as String?,
      userId: json['user_id'] as String?,
      vendor: json['vendor'] as String?,
      driverId: json['driver_id'] as String?,
      paymentType: json['payment_type'] as String?,
      paymentMode: json['payment_mode'] as String?,
      paid: json['paid'] as String?,
      due: json['due'] as String?,
      pickupLocation: json['pickup_location'] as String?,
      dropoffLocation: json['dropoff_location'] as String?,
      price: json['price'] as String?,
      commission: json['commission'] as String?,
      driverAmount: json['driver_amount'] as String?,
      tripType: json['trip_type'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      pickupTime: json['pickup_time'] as String?,
      pickupDate: json['pickup_date'] as String?,
      dropoffDate: json['dropoff_date'] as String?,
      createdAt: json['created_at'] as String?,
      status: json['status'] as String?,
      bookingStatus: json['booking_status'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_id': instance.bookingId,
      'user_id': instance.userId,
      'vendor': instance.vendor,
      'driver_id': instance.driverId,
      'payment_type': instance.paymentType,
      'payment_mode': instance.paymentMode,
      'paid': instance.paid,
      'due': instance.due,
      'pickup_location': instance.pickupLocation,
      'dropoff_location': instance.dropoffLocation,
      'price': instance.price,
      'commission': instance.commission,
      'driver_amount': instance.driverAmount,
      'trip_type': instance.tripType,
      'vehicle_type': instance.vehicleType,
      'pickup_time': instance.pickupTime,
      'pickup_date': instance.pickupDate,
      'dropoff_date': instance.dropoffDate,
      'created_at': instance.createdAt,
      'status': instance.status,
      'booking_status': instance.bookingStatus,
    };
