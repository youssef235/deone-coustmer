// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return _OrderResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderResponse {
  @JsonKey(name: "data")
  List<Order>? get projects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderResponseCopyWith<OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderResponseCopyWith<$Res> {
  factory $OrderResponseCopyWith(
          OrderResponse value, $Res Function(OrderResponse) then) =
      _$OrderResponseCopyWithImpl<$Res, OrderResponse>;
  @useResult
  $Res call({@JsonKey(name: "data") List<Order>? projects});
}

/// @nodoc
class _$OrderResponseCopyWithImpl<$Res, $Val extends OrderResponse>
    implements $OrderResponseCopyWith<$Res> {
  _$OrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
  }) {
    return _then(_value.copyWith(
      projects: freezed == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Order>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderResponseImplCopyWith<$Res>
    implements $OrderResponseCopyWith<$Res> {
  factory _$$OrderResponseImplCopyWith(
          _$OrderResponseImpl value, $Res Function(_$OrderResponseImpl) then) =
      __$$OrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "data") List<Order>? projects});
}

/// @nodoc
class __$$OrderResponseImplCopyWithImpl<$Res>
    extends _$OrderResponseCopyWithImpl<$Res, _$OrderResponseImpl>
    implements _$$OrderResponseImplCopyWith<$Res> {
  __$$OrderResponseImplCopyWithImpl(
      _$OrderResponseImpl _value, $Res Function(_$OrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
  }) {
    return _then(_$OrderResponseImpl(
      projects: freezed == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Order>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderResponseImpl implements _OrderResponse {
  const _$OrderResponseImpl(
      {@JsonKey(name: "data") final List<Order>? projects})
      : _projects = projects;

  factory _$OrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderResponseImplFromJson(json);

  final List<Order>? _projects;
  @override
  @JsonKey(name: "data")
  List<Order>? get projects {
    final value = _projects;
    if (value == null) return null;
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderResponse(projects: $projects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderResponseImpl &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_projects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderResponseImplCopyWith<_$OrderResponseImpl> get copyWith =>
      __$$OrderResponseImplCopyWithImpl<_$OrderResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderResponse implements OrderResponse {
  const factory _OrderResponse(
          {@JsonKey(name: "data") final List<Order>? projects}) =
      _$OrderResponseImpl;

  factory _OrderResponse.fromJson(Map<String, dynamic> json) =
      _$OrderResponseImpl.fromJson;

  @override
  @JsonKey(name: "data")
  List<Order>? get projects;
  @override
  @JsonKey(ignore: true)
  _$$OrderResponseImplCopyWith<_$OrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Providers? get provider => throw _privateConstructorUsedError;
  List<Proposals>? get proposals => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double? get location_lat => throw _privateConstructorUsedError;
  double? get location_lang => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get reviewed => throw _privateConstructorUsedError;
  bool? get have_a_proposal => throw _privateConstructorUsedError;
  String? get available_time => throw _privateConstructorUsedError;
  double get equipment_cost => throw _privateConstructorUsedError;
  double? get avg_rate => throw _privateConstructorUsedError;
  List<Attachment>? get attachment_audios => throw _privateConstructorUsedError;
  List<Attachment>? get attachment_images => throw _privateConstructorUsedError;
  List<Attachment>? get attachments_videos =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      Providers? provider,
      List<Proposals>? proposals,
      String? status,
      double? location_lat,
      double? location_lang,
      String? description,
      bool? reviewed,
      bool? have_a_proposal,
      String? available_time,
      double equipment_cost,
      double? avg_rate,
      List<Attachment>? attachment_audios,
      List<Attachment>? attachment_images,
      List<Attachment>? attachments_videos});

  $ProvidersCopyWith<$Res>? get provider;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? provider = freezed,
    Object? proposals = freezed,
    Object? status = freezed,
    Object? location_lat = freezed,
    Object? location_lang = freezed,
    Object? description = freezed,
    Object? reviewed = freezed,
    Object? have_a_proposal = freezed,
    Object? available_time = freezed,
    Object? equipment_cost = null,
    Object? avg_rate = freezed,
    Object? attachment_audios = freezed,
    Object? attachment_images = freezed,
    Object? attachments_videos = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Providers?,
      proposals: freezed == proposals
          ? _value.proposals
          : proposals // ignore: cast_nullable_to_non_nullable
              as List<Proposals>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: freezed == location_lat
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as double?,
      location_lang: freezed == location_lang
          ? _value.location_lang
          : location_lang // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewed: freezed == reviewed
          ? _value.reviewed
          : reviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      have_a_proposal: freezed == have_a_proposal
          ? _value.have_a_proposal
          : have_a_proposal // ignore: cast_nullable_to_non_nullable
              as bool?,
      available_time: freezed == available_time
          ? _value.available_time
          : available_time // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment_cost: null == equipment_cost
          ? _value.equipment_cost
          : equipment_cost // ignore: cast_nullable_to_non_nullable
              as double,
      avg_rate: freezed == avg_rate
          ? _value.avg_rate
          : avg_rate // ignore: cast_nullable_to_non_nullable
              as double?,
      attachment_audios: freezed == attachment_audios
          ? _value.attachment_audios
          : attachment_audios // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachment_images: freezed == attachment_images
          ? _value.attachment_images
          : attachment_images // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments_videos: freezed == attachments_videos
          ? _value.attachments_videos
          : attachments_videos // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProvidersCopyWith<$Res>? get provider {
    if (_value.provider == null) {
      return null;
    }

    return $ProvidersCopyWith<$Res>(_value.provider!, (value) {
      return _then(_value.copyWith(provider: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      Providers? provider,
      List<Proposals>? proposals,
      String? status,
      double? location_lat,
      double? location_lang,
      String? description,
      bool? reviewed,
      bool? have_a_proposal,
      String? available_time,
      double equipment_cost,
      double? avg_rate,
      List<Attachment>? attachment_audios,
      List<Attachment>? attachment_images,
      List<Attachment>? attachments_videos});

  @override
  $ProvidersCopyWith<$Res>? get provider;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? provider = freezed,
    Object? proposals = freezed,
    Object? status = freezed,
    Object? location_lat = freezed,
    Object? location_lang = freezed,
    Object? description = freezed,
    Object? reviewed = freezed,
    Object? have_a_proposal = freezed,
    Object? available_time = freezed,
    Object? equipment_cost = null,
    Object? avg_rate = freezed,
    Object? attachment_audios = freezed,
    Object? attachment_images = freezed,
    Object? attachments_videos = freezed,
  }) {
    return _then(_$OrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Providers?,
      proposals: freezed == proposals
          ? _value._proposals
          : proposals // ignore: cast_nullable_to_non_nullable
              as List<Proposals>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: freezed == location_lat
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as double?,
      location_lang: freezed == location_lang
          ? _value.location_lang
          : location_lang // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewed: freezed == reviewed
          ? _value.reviewed
          : reviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      have_a_proposal: freezed == have_a_proposal
          ? _value.have_a_proposal
          : have_a_proposal // ignore: cast_nullable_to_non_nullable
              as bool?,
      available_time: freezed == available_time
          ? _value.available_time
          : available_time // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment_cost: null == equipment_cost
          ? _value.equipment_cost
          : equipment_cost // ignore: cast_nullable_to_non_nullable
              as double,
      avg_rate: freezed == avg_rate
          ? _value.avg_rate
          : avg_rate // ignore: cast_nullable_to_non_nullable
              as double?,
      attachment_audios: freezed == attachment_audios
          ? _value._attachment_audios
          : attachment_audios // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachment_images: freezed == attachment_images
          ? _value._attachment_images
          : attachment_images // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments_videos: freezed == attachments_videos
          ? _value._attachments_videos
          : attachments_videos // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {this.id,
      this.name,
      this.provider,
      final List<Proposals>? proposals = const [],
      this.status,
      this.location_lat,
      this.location_lang,
      this.description,
      this.reviewed,
      this.have_a_proposal,
      this.available_time,
      this.equipment_cost = 0,
      this.avg_rate,
      final List<Attachment>? attachment_audios,
      final List<Attachment>? attachment_images,
      final List<Attachment>? attachments_videos})
      : _proposals = proposals,
        _attachment_audios = attachment_audios,
        _attachment_images = attachment_images,
        _attachments_videos = attachments_videos;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final Providers? provider;
  final List<Proposals>? _proposals;
  @override
  @JsonKey()
  List<Proposals>? get proposals {
    final value = _proposals;
    if (value == null) return null;
    if (_proposals is EqualUnmodifiableListView) return _proposals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final double? location_lat;
  @override
  final double? location_lang;
  @override
  final String? description;
  @override
  final bool? reviewed;
  @override
  final bool? have_a_proposal;
  @override
  final String? available_time;
  @override
  @JsonKey()
  final double equipment_cost;
  @override
  final double? avg_rate;
  final List<Attachment>? _attachment_audios;
  @override
  List<Attachment>? get attachment_audios {
    final value = _attachment_audios;
    if (value == null) return null;
    if (_attachment_audios is EqualUnmodifiableListView)
      return _attachment_audios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Attachment>? _attachment_images;
  @override
  List<Attachment>? get attachment_images {
    final value = _attachment_images;
    if (value == null) return null;
    if (_attachment_images is EqualUnmodifiableListView)
      return _attachment_images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Attachment>? _attachments_videos;
  @override
  List<Attachment>? get attachments_videos {
    final value = _attachments_videos;
    if (value == null) return null;
    if (_attachments_videos is EqualUnmodifiableListView)
      return _attachments_videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Order(id: $id, name: $name, provider: $provider, proposals: $proposals, status: $status, location_lat: $location_lat, location_lang: $location_lang, description: $description, reviewed: $reviewed, have_a_proposal: $have_a_proposal, available_time: $available_time, equipment_cost: $equipment_cost, avg_rate: $avg_rate, attachment_audios: $attachment_audios, attachment_images: $attachment_images, attachments_videos: $attachments_videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            const DeepCollectionEquality()
                .equals(other._proposals, _proposals) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.location_lat, location_lat) ||
                other.location_lat == location_lat) &&
            (identical(other.location_lang, location_lang) ||
                other.location_lang == location_lang) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reviewed, reviewed) ||
                other.reviewed == reviewed) &&
            (identical(other.have_a_proposal, have_a_proposal) ||
                other.have_a_proposal == have_a_proposal) &&
            (identical(other.available_time, available_time) ||
                other.available_time == available_time) &&
            (identical(other.equipment_cost, equipment_cost) ||
                other.equipment_cost == equipment_cost) &&
            (identical(other.avg_rate, avg_rate) ||
                other.avg_rate == avg_rate) &&
            const DeepCollectionEquality()
                .equals(other._attachment_audios, _attachment_audios) &&
            const DeepCollectionEquality()
                .equals(other._attachment_images, _attachment_images) &&
            const DeepCollectionEquality()
                .equals(other._attachments_videos, _attachments_videos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      provider,
      const DeepCollectionEquality().hash(_proposals),
      status,
      location_lat,
      location_lang,
      description,
      reviewed,
      have_a_proposal,
      available_time,
      equipment_cost,
      avg_rate,
      const DeepCollectionEquality().hash(_attachment_audios),
      const DeepCollectionEquality().hash(_attachment_images),
      const DeepCollectionEquality().hash(_attachments_videos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {final int? id,
      final String? name,
      final Providers? provider,
      final List<Proposals>? proposals,
      final String? status,
      final double? location_lat,
      final double? location_lang,
      final String? description,
      final bool? reviewed,
      final bool? have_a_proposal,
      final String? available_time,
      final double equipment_cost,
      final double? avg_rate,
      final List<Attachment>? attachment_audios,
      final List<Attachment>? attachment_images,
      final List<Attachment>? attachments_videos}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  Providers? get provider;
  @override
  List<Proposals>? get proposals;
  @override
  String? get status;
  @override
  double? get location_lat;
  @override
  double? get location_lang;
  @override
  String? get description;
  @override
  bool? get reviewed;
  @override
  bool? get have_a_proposal;
  @override
  String? get available_time;
  @override
  double get equipment_cost;
  @override
  double? get avg_rate;
  @override
  List<Attachment>? get attachment_audios;
  @override
  List<Attachment>? get attachment_images;
  @override
  List<Attachment>? get attachments_videos;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Proposals _$ProposalsFromJson(Map<String, dynamic> json) {
  return _Proposals.fromJson(json);
}

/// @nodoc
mixin _$Proposals {
  int? get id => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get original_price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Providers? get provider => throw _privateConstructorUsedError;
  List<Attachment>? get attachment_audios => throw _privateConstructorUsedError;
  List<Attachment>? get attachments => throw _privateConstructorUsedError;
  Project? get project => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProposalsCopyWith<Proposals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProposalsCopyWith<$Res> {
  factory $ProposalsCopyWith(Proposals value, $Res Function(Proposals) then) =
      _$ProposalsCopyWithImpl<$Res, Proposals>;
  @useResult
  $Res call(
      {int? id,
      double? price,
      double? original_price,
      String? description,
      Providers? provider,
      List<Attachment>? attachment_audios,
      List<Attachment>? attachments,
      Project? project,
      String? status,
      String? created_at});

  $ProvidersCopyWith<$Res>? get provider;
  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class _$ProposalsCopyWithImpl<$Res, $Val extends Proposals>
    implements $ProposalsCopyWith<$Res> {
  _$ProposalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? price = freezed,
    Object? original_price = freezed,
    Object? description = freezed,
    Object? provider = freezed,
    Object? attachment_audios = freezed,
    Object? attachments = freezed,
    Object? project = freezed,
    Object? status = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      original_price: freezed == original_price
          ? _value.original_price
          : original_price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Providers?,
      attachment_audios: freezed == attachment_audios
          ? _value.attachment_audios
          : attachment_audios // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProvidersCopyWith<$Res>? get provider {
    if (_value.provider == null) {
      return null;
    }

    return $ProvidersCopyWith<$Res>(_value.provider!, (value) {
      return _then(_value.copyWith(provider: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProposalsImplCopyWith<$Res>
    implements $ProposalsCopyWith<$Res> {
  factory _$$ProposalsImplCopyWith(
          _$ProposalsImpl value, $Res Function(_$ProposalsImpl) then) =
      __$$ProposalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      double? price,
      double? original_price,
      String? description,
      Providers? provider,
      List<Attachment>? attachment_audios,
      List<Attachment>? attachments,
      Project? project,
      String? status,
      String? created_at});

  @override
  $ProvidersCopyWith<$Res>? get provider;
  @override
  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$ProposalsImplCopyWithImpl<$Res>
    extends _$ProposalsCopyWithImpl<$Res, _$ProposalsImpl>
    implements _$$ProposalsImplCopyWith<$Res> {
  __$$ProposalsImplCopyWithImpl(
      _$ProposalsImpl _value, $Res Function(_$ProposalsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? price = freezed,
    Object? original_price = freezed,
    Object? description = freezed,
    Object? provider = freezed,
    Object? attachment_audios = freezed,
    Object? attachments = freezed,
    Object? project = freezed,
    Object? status = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_$ProposalsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      original_price: freezed == original_price
          ? _value.original_price
          : original_price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Providers?,
      attachment_audios: freezed == attachment_audios
          ? _value._attachment_audios
          : attachment_audios // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProposalsImpl implements _Proposals {
  const _$ProposalsImpl(
      {this.id,
      this.price,
      this.original_price,
      this.description,
      this.provider,
      final List<Attachment>? attachment_audios = const [],
      final List<Attachment>? attachments = const [],
      this.project,
      this.status,
      this.created_at})
      : _attachment_audios = attachment_audios,
        _attachments = attachments;

  factory _$ProposalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProposalsImplFromJson(json);

  @override
  final int? id;
  @override
  final double? price;
  @override
  final double? original_price;
  @override
  final String? description;
  @override
  final Providers? provider;
  final List<Attachment>? _attachment_audios;
  @override
  @JsonKey()
  List<Attachment>? get attachment_audios {
    final value = _attachment_audios;
    if (value == null) return null;
    if (_attachment_audios is EqualUnmodifiableListView)
      return _attachment_audios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Attachment>? _attachments;
  @override
  @JsonKey()
  List<Attachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Project? project;
  @override
  final String? status;
  @override
  final String? created_at;

  @override
  String toString() {
    return 'Proposals(id: $id, price: $price, original_price: $original_price, description: $description, provider: $provider, attachment_audios: $attachment_audios, attachments: $attachments, project: $project, status: $status, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProposalsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.original_price, original_price) ||
                other.original_price == original_price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            const DeepCollectionEquality()
                .equals(other._attachment_audios, _attachment_audios) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      original_price,
      description,
      provider,
      const DeepCollectionEquality().hash(_attachment_audios),
      const DeepCollectionEquality().hash(_attachments),
      project,
      status,
      created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProposalsImplCopyWith<_$ProposalsImpl> get copyWith =>
      __$$ProposalsImplCopyWithImpl<_$ProposalsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProposalsImplToJson(
      this,
    );
  }
}

abstract class _Proposals implements Proposals {
  const factory _Proposals(
      {final int? id,
      final double? price,
      final double? original_price,
      final String? description,
      final Providers? provider,
      final List<Attachment>? attachment_audios,
      final List<Attachment>? attachments,
      final Project? project,
      final String? status,
      final String? created_at}) = _$ProposalsImpl;

  factory _Proposals.fromJson(Map<String, dynamic> json) =
      _$ProposalsImpl.fromJson;

  @override
  int? get id;
  @override
  double? get price;
  @override
  double? get original_price;
  @override
  String? get description;
  @override
  Providers? get provider;
  @override
  List<Attachment>? get attachment_audios;
  @override
  List<Attachment>? get attachments;
  @override
  Project? get project;
  @override
  String? get status;
  @override
  String? get created_at;
  @override
  @JsonKey(ignore: true)
  _$$ProposalsImplCopyWith<_$ProposalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Providers _$ProvidersFromJson(Map<String, dynamic> json) {
  return _Providers.fromJson(json);
}

/// @nodoc
mixin _$Providers {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get firebase_token => throw _privateConstructorUsedError;
  double? get avg_rate => throw _privateConstructorUsedError;
  String? get location_lat => throw _privateConstructorUsedError;
  String? get location_lang => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProvidersCopyWith<Providers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvidersCopyWith<$Res> {
  factory $ProvidersCopyWith(Providers value, $Res Function(Providers) then) =
      _$ProvidersCopyWithImpl<$Res, Providers>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? phone,
      String? avatar,
      String? firebase_token,
      double? avg_rate,
      String? location_lat,
      String? location_lang});
}

/// @nodoc
class _$ProvidersCopyWithImpl<$Res, $Val extends Providers>
    implements $ProvidersCopyWith<$Res> {
  _$ProvidersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? firebase_token = freezed,
    Object? avg_rate = freezed,
    Object? location_lat = freezed,
    Object? location_lang = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      firebase_token: freezed == firebase_token
          ? _value.firebase_token
          : firebase_token // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_rate: freezed == avg_rate
          ? _value.avg_rate
          : avg_rate // ignore: cast_nullable_to_non_nullable
              as double?,
      location_lat: freezed == location_lat
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lang: freezed == location_lang
          ? _value.location_lang
          : location_lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvidersImplCopyWith<$Res>
    implements $ProvidersCopyWith<$Res> {
  factory _$$ProvidersImplCopyWith(
          _$ProvidersImpl value, $Res Function(_$ProvidersImpl) then) =
      __$$ProvidersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? phone,
      String? avatar,
      String? firebase_token,
      double? avg_rate,
      String? location_lat,
      String? location_lang});
}

/// @nodoc
class __$$ProvidersImplCopyWithImpl<$Res>
    extends _$ProvidersCopyWithImpl<$Res, _$ProvidersImpl>
    implements _$$ProvidersImplCopyWith<$Res> {
  __$$ProvidersImplCopyWithImpl(
      _$ProvidersImpl _value, $Res Function(_$ProvidersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? firebase_token = freezed,
    Object? avg_rate = freezed,
    Object? location_lat = freezed,
    Object? location_lang = freezed,
  }) {
    return _then(_$ProvidersImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      firebase_token: freezed == firebase_token
          ? _value.firebase_token
          : firebase_token // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_rate: freezed == avg_rate
          ? _value.avg_rate
          : avg_rate // ignore: cast_nullable_to_non_nullable
              as double?,
      location_lat: freezed == location_lat
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lang: freezed == location_lang
          ? _value.location_lang
          : location_lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvidersImpl implements _Providers {
  const _$ProvidersImpl(
      {this.id,
      this.name,
      this.phone,
      this.avatar,
      this.firebase_token,
      this.avg_rate,
      this.location_lat,
      this.location_lang});

  factory _$ProvidersImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvidersImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? avatar;
  @override
  final String? firebase_token;
  @override
  final double? avg_rate;
  @override
  final String? location_lat;
  @override
  final String? location_lang;

  @override
  String toString() {
    return 'Providers(id: $id, name: $name, phone: $phone, avatar: $avatar, firebase_token: $firebase_token, avg_rate: $avg_rate, location_lat: $location_lat, location_lang: $location_lang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvidersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.firebase_token, firebase_token) ||
                other.firebase_token == firebase_token) &&
            (identical(other.avg_rate, avg_rate) ||
                other.avg_rate == avg_rate) &&
            (identical(other.location_lat, location_lat) ||
                other.location_lat == location_lat) &&
            (identical(other.location_lang, location_lang) ||
                other.location_lang == location_lang));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, avatar,
      firebase_token, avg_rate, location_lat, location_lang);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvidersImplCopyWith<_$ProvidersImpl> get copyWith =>
      __$$ProvidersImplCopyWithImpl<_$ProvidersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvidersImplToJson(
      this,
    );
  }
}

abstract class _Providers implements Providers {
  const factory _Providers(
      {final int? id,
      final String? name,
      final String? phone,
      final String? avatar,
      final String? firebase_token,
      final double? avg_rate,
      final String? location_lat,
      final String? location_lang}) = _$ProvidersImpl;

  factory _Providers.fromJson(Map<String, dynamic> json) =
      _$ProvidersImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get avatar;
  @override
  String? get firebase_token;
  @override
  double? get avg_rate;
  @override
  String? get location_lat;
  @override
  String? get location_lang;
  @override
  @JsonKey(ignore: true)
  _$$ProvidersImplCopyWith<_$ProvidersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  dynamic get location_lat => throw _privateConstructorUsedError;
  dynamic get location_lang => throw _privateConstructorUsedError;
  String? get available_time => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double get equipment_cost => throw _privateConstructorUsedError;
  bool? get reviewed => throw _privateConstructorUsedError;
  List<Attachment>? get attachment_audios => throw _privateConstructorUsedError;
  List<Attachment>? get attachment_images => throw _privateConstructorUsedError;
  List<Attachment>? get attachments_videos =>
      throw _privateConstructorUsedError;
  List<Attachment>? get attachments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      dynamic location_lat,
      dynamic location_lang,
      String? available_time,
      String? date,
      String? status,
      double equipment_cost,
      bool? reviewed,
      List<Attachment>? attachment_audios,
      List<Attachment>? attachment_images,
      List<Attachment>? attachments_videos,
      List<Attachment>? attachments});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? location_lat = freezed,
    Object? location_lang = freezed,
    Object? available_time = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? equipment_cost = null,
    Object? reviewed = freezed,
    Object? attachment_audios = freezed,
    Object? attachment_images = freezed,
    Object? attachments_videos = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: freezed == location_lat
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location_lang: freezed == location_lang
          ? _value.location_lang
          : location_lang // ignore: cast_nullable_to_non_nullable
              as dynamic,
      available_time: freezed == available_time
          ? _value.available_time
          : available_time // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment_cost: null == equipment_cost
          ? _value.equipment_cost
          : equipment_cost // ignore: cast_nullable_to_non_nullable
              as double,
      reviewed: freezed == reviewed
          ? _value.reviewed
          : reviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachment_audios: freezed == attachment_audios
          ? _value.attachment_audios
          : attachment_audios // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachment_images: freezed == attachment_images
          ? _value.attachment_images
          : attachment_images // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments_videos: freezed == attachments_videos
          ? _value.attachments_videos
          : attachments_videos // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      dynamic location_lat,
      dynamic location_lang,
      String? available_time,
      String? date,
      String? status,
      double equipment_cost,
      bool? reviewed,
      List<Attachment>? attachment_audios,
      List<Attachment>? attachment_images,
      List<Attachment>? attachments_videos,
      List<Attachment>? attachments});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? location_lat = freezed,
    Object? location_lang = freezed,
    Object? available_time = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? equipment_cost = null,
    Object? reviewed = freezed,
    Object? attachment_audios = freezed,
    Object? attachment_images = freezed,
    Object? attachments_videos = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_$ProjectImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: freezed == location_lat
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location_lang: freezed == location_lang
          ? _value.location_lang
          : location_lang // ignore: cast_nullable_to_non_nullable
              as dynamic,
      available_time: freezed == available_time
          ? _value.available_time
          : available_time // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment_cost: null == equipment_cost
          ? _value.equipment_cost
          : equipment_cost // ignore: cast_nullable_to_non_nullable
              as double,
      reviewed: freezed == reviewed
          ? _value.reviewed
          : reviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachment_audios: freezed == attachment_audios
          ? _value._attachment_audios
          : attachment_audios // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachment_images: freezed == attachment_images
          ? _value._attachment_images
          : attachment_images // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments_videos: freezed == attachments_videos
          ? _value._attachments_videos
          : attachments_videos // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {this.id,
      this.name,
      this.description,
      this.location_lat,
      this.location_lang,
      this.available_time,
      this.date,
      this.status,
      this.equipment_cost = 0,
      this.reviewed,
      final List<Attachment>? attachment_audios,
      final List<Attachment>? attachment_images,
      final List<Attachment>? attachments_videos,
      final List<Attachment>? attachments})
      : _attachment_audios = attachment_audios,
        _attachment_images = attachment_images,
        _attachments_videos = attachments_videos,
        _attachments = attachments;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final dynamic location_lat;
  @override
  final dynamic location_lang;
  @override
  final String? available_time;
  @override
  final String? date;
  @override
  final String? status;
  @override
  @JsonKey()
  final double equipment_cost;
  @override
  final bool? reviewed;
  final List<Attachment>? _attachment_audios;
  @override
  List<Attachment>? get attachment_audios {
    final value = _attachment_audios;
    if (value == null) return null;
    if (_attachment_audios is EqualUnmodifiableListView)
      return _attachment_audios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Attachment>? _attachment_images;
  @override
  List<Attachment>? get attachment_images {
    final value = _attachment_images;
    if (value == null) return null;
    if (_attachment_images is EqualUnmodifiableListView)
      return _attachment_images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Attachment>? _attachments_videos;
  @override
  List<Attachment>? get attachments_videos {
    final value = _attachments_videos;
    if (value == null) return null;
    if (_attachments_videos is EqualUnmodifiableListView)
      return _attachments_videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Attachment>? _attachments;
  @override
  List<Attachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.location_lat, location_lat) &&
            const DeepCollectionEquality()
                .equals(other.location_lang, location_lang) &&
            (identical(other.available_time, available_time) ||
                other.available_time == available_time) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.equipment_cost, equipment_cost) ||
                other.equipment_cost == equipment_cost) &&
            (identical(other.reviewed, reviewed) ||
                other.reviewed == reviewed) &&
            const DeepCollectionEquality()
                .equals(other._attachment_audios, _attachment_audios) &&
            const DeepCollectionEquality()
                .equals(other._attachment_images, _attachment_images) &&
            const DeepCollectionEquality()
                .equals(other._attachments_videos, _attachments_videos) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(location_lat),
      const DeepCollectionEquality().hash(location_lang),
      available_time,
      date,
      status,
      equipment_cost,
      reviewed,
      const DeepCollectionEquality().hash(_attachment_audios),
      const DeepCollectionEquality().hash(_attachment_images),
      const DeepCollectionEquality().hash(_attachments_videos),
      const DeepCollectionEquality().hash(_attachments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {final int? id,
      final String? name,
      final String? description,
      final dynamic location_lat,
      final dynamic location_lang,
      final String? available_time,
      final String? date,
      final String? status,
      final double equipment_cost,
      final bool? reviewed,
      final List<Attachment>? attachment_audios,
      final List<Attachment>? attachment_images,
      final List<Attachment>? attachments_videos,
      final List<Attachment>? attachments}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  dynamic get location_lat;
  @override
  dynamic get location_lang;
  @override
  String? get available_time;
  @override
  String? get date;
  @override
  String? get status;
  @override
  double get equipment_cost;
  @override
  bool? get reviewed;
  @override
  List<Attachment>? get attachment_audios;
  @override
  List<Attachment>? get attachment_images;
  @override
  List<Attachment>? get attachments_videos;
  @override
  List<Attachment>? get attachments;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  int? get id => throw _privateConstructorUsedError;
  int? get rate => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call({int? id, int? rate, String? review, String? avatar});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? review = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? rate, String? review, String? avatar});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? review = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$ReviewImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl({this.id, this.rate, this.review, this.avatar});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final int? id;
  @override
  final int? rate;
  @override
  final String? review;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'Review(id: $id, rate: $rate, review: $review, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, rate, review, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {final int? id,
      final int? rate,
      final String? review,
      final String? avatar}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  int? get id;
  @override
  int? get rate;
  @override
  String? get review;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
mixin _$Attachment {
  int? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
          Attachment value, $Res Function(Attachment) then) =
      _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
  $Res call({int? id, String? url, String? type});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttachmentImplCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$AttachmentImplCopyWith(
          _$AttachmentImpl value, $Res Function(_$AttachmentImpl) then) =
      __$$AttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? url, String? type});
}

/// @nodoc
class __$$AttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$AttachmentImpl>
    implements _$$AttachmentImplCopyWith<$Res> {
  __$$AttachmentImplCopyWithImpl(
      _$AttachmentImpl _value, $Res Function(_$AttachmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? type = freezed,
  }) {
    return _then(_$AttachmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentImpl implements _Attachment {
  const _$AttachmentImpl({this.id, this.url, this.type});

  factory _$AttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentImplFromJson(json);

  @override
  final int? id;
  @override
  final String? url;
  @override
  final String? type;

  @override
  String toString() {
    return 'Attachment(id: $id, url: $url, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      __$$AttachmentImplCopyWithImpl<_$AttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentImplToJson(
      this,
    );
  }
}

abstract class _Attachment implements Attachment {
  const factory _Attachment(
      {final int? id,
      final String? url,
      final String? type}) = _$AttachmentImpl;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$AttachmentImpl.fromJson;

  @override
  int? get id;
  @override
  String? get url;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String? get body => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  Project? get project => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String? body, String? title, Project? project, String? created_at});

  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? title = freezed,
    Object? project = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? body, String? title, Project? project, String? created_at});

  @override
  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? title = freezed,
    Object? project = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_$NotificationImpl(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {this.body, this.title, this.project, this.created_at});

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String? body;
  @override
  final String? title;
  @override
  final Project? project;
  @override
  final String? created_at;

  @override
  String toString() {
    return 'Notification(body: $body, title: $title, project: $project, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, body, title, project, created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {final String? body,
      final String? title,
      final Project? project,
      final String? created_at}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String? get body;
  @override
  String? get title;
  @override
  Project? get project;
  @override
  String? get created_at;
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
