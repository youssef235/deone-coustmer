import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'home_response.freezed.dart';
part 'home_response.g.dart';

ServicesResponse homeResponseFromJson(String str) =>
    ServicesResponse.fromJson(json.decode(str));

String homeResponseToJson(ServicesResponse data) => json.encode(data.toJson());

@freezed
class ServicesResponse with _$ServicesResponse {
  const factory ServicesResponse({
    @JsonKey(name: "services") List<Service>? services,
    List<String>? slides,
  }) = _ServicesResponse;
  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    int? id,
    String? name,
    String? status,
    String? created_at,
    String? has_two_location,
    ServiceIcon? icon,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class ServiceIcon with _$ServiceIcon {
  const factory ServiceIcon({
    int? id,
    String? url,
    String? type,
  }) = _ServiceIcon;

  factory ServiceIcon.fromJson(Map<String, dynamic> json) =>
      _$ServiceIconFromJson(json);
}
