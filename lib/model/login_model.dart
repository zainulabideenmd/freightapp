// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'login_model.g.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "method")
  String? method;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "data")
  Data? data;

  LoginModel({
    this.path,
    this.method,
    this.statusCode,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "result")
  Result? result;

  Data({
    this.success,
    this.code,
    this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "userImage")
  String? userImage;
  @JsonKey(name: "accessToken")
  String? accessToken;
  @JsonKey(name: "userEmail")
  String? userEmail;
  @JsonKey(name: "password")
  String? password;

  Result({
    this.userId,
    this.userName,
    this.userImage,
    this.accessToken,
    this.userEmail,
    this.password,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
