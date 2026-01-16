import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'booking_model.dart';

part 'all_bookings_response_model.g.dart';

@JsonSerializable()
class AllBookingsResponseModel extends Equatable {
  const AllBookingsResponseModel({required this.bookings});

  factory AllBookingsResponseModel.fromJson(dynamic json) {
    if (json is List) {
      return AllBookingsResponseModel(
        bookings:
            json
                .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      );
    }

    if (json is Map<String, dynamic>) {
      return _$AllBookingsResponseModelFromJson(json);
    }

    return AllBookingsResponseModel(bookings: []);
  }

  Map<String, dynamic> toJson() => _$AllBookingsResponseModelToJson(this);

  final List<BookingModel> bookings;

  @override
  List<Object?> get props => [bookings];
}
