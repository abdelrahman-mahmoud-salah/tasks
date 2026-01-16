import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel extends Equatable {
  const BookingModel({
    this.id,
    this.bookingId,
    this.userId,
    this.vendor,
    this.driverId,
    this.paymentType,
    this.paymentMode,
    this.paid,
    this.due,
    this.pickupLocation,
    this.dropoffLocation,
    this.price,
    this.commission,
    this.driverAmount,
    this.tripType,
    this.vehicleType,
    this.pickupTime,
    this.pickupDate,
    this.dropoffDate,
    this.createdAt,
    this.status,
    this.bookingStatus,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  final int? id;

  @JsonKey(name: 'booking_id')
  final String? bookingId;

  @JsonKey(name: 'user_id')
  final String? userId;

  final String? vendor;

  @JsonKey(name: 'driver_id')
  final String? driverId;

  @JsonKey(name: 'payment_type')
  final String? paymentType;

  @JsonKey(name: 'payment_mode')
  final String? paymentMode;

  final String? paid;
  final String? due;

  @JsonKey(name: 'pickup_location')
  final String? pickupLocation;

  @JsonKey(name: 'dropoff_location')
  final String? dropoffLocation;

  final String? price;
  final String? commission;

  @JsonKey(name: 'driver_amount')
  final String? driverAmount;

  @JsonKey(name: 'trip_type')
  final String? tripType;

  @JsonKey(name: 'vehicle_type')
  final String? vehicleType;

  @JsonKey(name: 'pickup_time')
  final String? pickupTime;

  @JsonKey(name: 'pickup_date')
  final String? pickupDate;

  @JsonKey(name: 'dropoff_date')
  final String? dropoffDate;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  final String? status;

  @JsonKey(name: 'booking_status')
  final String? bookingStatus;

  @override
  List<Object?> get props => [
    id,
    bookingId,
    userId,
    vendor,
    driverId,
    paymentType,
    paymentMode,
    paid,
    due,
    pickupLocation,
    dropoffLocation,
    price,
    commission,
    driverAmount,
    tripType,
    vehicleType,
    pickupTime,
    pickupDate,
    dropoffDate,
    createdAt,
    status,
    bookingStatus,
  ];
}
