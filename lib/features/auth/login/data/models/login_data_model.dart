import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data_model.g.dart';

@JsonSerializable()

class LoginDataModel extends Equatable {
  LoginDataModel({this.status, this.message, this.token});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);

  final int? status;
  final String? message;
  final String? token;

  @override
  List<Object?> get props => [status, message, token];
}
