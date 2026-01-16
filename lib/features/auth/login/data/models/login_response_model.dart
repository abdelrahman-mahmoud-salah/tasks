import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'login_data_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class LoginResponseModel extends Equatable {
  LoginResponseModel(this.data);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
   
    if (json.containsKey('data')) {
      return _$LoginResponseModelFromJson(json);
    } else {
      // Wrap the direct response in a 'data' object
      return LoginResponseModel(
        LoginDataModel.fromJson(json),
      );
    }
  }

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  LoginDataModel data;

  @override
  List<Object?> get props => [data];
}
