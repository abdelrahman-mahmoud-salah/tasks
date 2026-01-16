import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class LoginRequestModel extends Equatable {
  LoginRequestModel({required this.phone, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  final String phone;
  final String password;

  @override
  List<Object?> get props => [phone, password];
}
