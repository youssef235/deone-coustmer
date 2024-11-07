import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'order_response.freezed.dart';
part 'order_response.g.dart';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    @JsonKey(name: "data") List<Order>? projects,
  }) = _OrderResponse;
  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    int? id,
    String? name,
    Providers? provider,
    @Default([]) List<Proposals>? proposals,
    String? status,
    double? location_lat,
    double? location_lang,
    String? description,
    bool? reviewed,
    bool? have_a_proposal,
    String? available_time,
    @Default(0) double equipment_cost,
    double? avg_rate,
    List<Attachment>? attachment_audios,
    List<Attachment>? attachment_images,
    List<Attachment>? attachments_videos,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class Proposals with _$Proposals {
  const factory Proposals({
    int? id,
    double? price,
    double? original_price,
    String? description,
    Providers? provider,
    @Default([]) List<Attachment>? attachment_audios,
    @Default([]) List<Attachment>? attachments,
    Project? project,
    String? status,
    String? created_at,
  }) = _Proposals;

  factory Proposals.fromJson(Map<String, dynamic> json) =>
      _$ProposalsFromJson(json);
}

@freezed
class Providers with _$Providers {
  const factory Providers({
    int? id,
    String? name,
    String? phone,
    String? avatar,
    String? firebase_token,
    double? avg_rate,
    String? location_lat,
    String? location_lang,
  }) = _Providers;

  factory Providers.fromJson(Map<String, dynamic> json) =>
      _$ProvidersFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    int? id,
    String? name,
    String? description,
    dynamic location_lat,
    dynamic location_lang,
    String? available_time,
    String? date,
    String? status,
    @Default(0) double equipment_cost,
    bool? reviewed,
    List<Attachment>? attachment_audios,
    List<Attachment>? attachment_images,
    List<Attachment>? attachments_videos,
    List<Attachment>? attachments,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  @override
  String toString() {
    return 'Project(id: $id, name: $name, description: $description, location_lat: $location_lat, location_lang: $location_lang, available_time: $available_time, date: $date, status: $status, equipment_cost: $equipment_cost, reviewed: $reviewed, attachment_audios: $attachment_audios, attachment_images: $attachment_images, attachments_videos: $attachments_videos, attachments: $attachments)';
  }
}

@freezed
class Review with _$Review {
  const factory Review({int? id, int? rate, String? review, String? avatar}) =
      _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    int? id,
    String? url,
    String? type,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    String? body,
    String? title,
    Project? project,
    String? created_at,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
