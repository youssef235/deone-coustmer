// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServicesResponse _$ServicesResponseFromJson(Map<String, dynamic> json) {
  return _ServicesResponse.fromJson(json);
}

/// @nodoc
mixin _$ServicesResponse {
  @JsonKey(name: "services")
  List<Service>? get services => throw _privateConstructorUsedError;
  List<String>? get slides => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesResponseCopyWith<ServicesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesResponseCopyWith<$Res> {
  factory $ServicesResponseCopyWith(
          ServicesResponse value, $Res Function(ServicesResponse) then) =
      _$ServicesResponseCopyWithImpl<$Res, ServicesResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "services") List<Service>? services,
      List<String>? slides});
}

/// @nodoc
class _$ServicesResponseCopyWithImpl<$Res, $Val extends ServicesResponse>
    implements $ServicesResponseCopyWith<$Res> {
  _$ServicesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = freezed,
    Object? slides = freezed,
  }) {
    return _then(_value.copyWith(
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      slides: freezed == slides
          ? _value.slides
          : slides // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicesResponseImplCopyWith<$Res>
    implements $ServicesResponseCopyWith<$Res> {
  factory _$$ServicesResponseImplCopyWith(_$ServicesResponseImpl value,
          $Res Function(_$ServicesResponseImpl) then) =
      __$$ServicesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "services") List<Service>? services,
      List<String>? slides});
}

/// @nodoc
class __$$ServicesResponseImplCopyWithImpl<$Res>
    extends _$ServicesResponseCopyWithImpl<$Res, _$ServicesResponseImpl>
    implements _$$ServicesResponseImplCopyWith<$Res> {
  __$$ServicesResponseImplCopyWithImpl(_$ServicesResponseImpl _value,
      $Res Function(_$ServicesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = freezed,
    Object? slides = freezed,
  }) {
    return _then(_$ServicesResponseImpl(
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      slides: freezed == slides
          ? _value._slides
          : slides // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicesResponseImpl implements _ServicesResponse {
  const _$ServicesResponseImpl(
      {@JsonKey(name: "services") final List<Service>? services,
      final List<String>? slides})
      : _services = services,
        _slides = slides;

  factory _$ServicesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicesResponseImplFromJson(json);

  final List<Service>? _services;
  @override
  @JsonKey(name: "services")
  List<Service>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _slides;
  @override
  List<String>? get slides {
    final value = _slides;
    if (value == null) return null;
    if (_slides is EqualUnmodifiableListView) return _slides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServicesResponse(services: $services, slides: $slides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesResponseImpl &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._slides, _slides));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_slides));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesResponseImplCopyWith<_$ServicesResponseImpl> get copyWith =>
      __$$ServicesResponseImplCopyWithImpl<_$ServicesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicesResponseImplToJson(
      this,
    );
  }
}

abstract class _ServicesResponse implements ServicesResponse {
  const factory _ServicesResponse(
      {@JsonKey(name: "services") final List<Service>? services,
      final List<String>? slides}) = _$ServicesResponseImpl;

  factory _ServicesResponse.fromJson(Map<String, dynamic> json) =
      _$ServicesResponseImpl.fromJson;

  @override
  @JsonKey(name: "services")
  List<Service>? get services;
  @override
  List<String>? get slides;
  @override
  @JsonKey(ignore: true)
  _$$ServicesResponseImplCopyWith<_$ServicesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;
  String? get has_two_location => throw _privateConstructorUsedError;
  ServiceIcon? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? status,
      String? created_at,
      String? has_two_location,
      ServiceIcon? icon});

  $ServiceIconCopyWith<$Res>? get icon;
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? created_at = freezed,
    Object? has_two_location = freezed,
    Object? icon = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      has_two_location: freezed == has_two_location
          ? _value.has_two_location
          : has_two_location // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as ServiceIcon?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceIconCopyWith<$Res>? get icon {
    if (_value.icon == null) {
      return null;
    }

    return $ServiceIconCopyWith<$Res>(_value.icon!, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? status,
      String? created_at,
      String? has_two_location,
      ServiceIcon? icon});

  @override
  $ServiceIconCopyWith<$Res>? get icon;
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? created_at = freezed,
    Object? has_two_location = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$ServiceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      has_two_location: freezed == has_two_location
          ? _value.has_two_location
          : has_two_location // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as ServiceIcon?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {this.id,
      this.name,
      this.status,
      this.created_at,
      this.has_two_location,
      this.icon});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? status;
  @override
  final String? created_at;
  @override
  final String? has_two_location;
  @override
  final ServiceIcon? icon;

  @override
  String toString() {
    return 'Service(id: $id, name: $name, status: $status, created_at: $created_at, has_two_location: $has_two_location, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.has_two_location, has_two_location) ||
                other.has_two_location == has_two_location) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, status, created_at, has_two_location, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {final int? id,
      final String? name,
      final String? status,
      final String? created_at,
      final String? has_two_location,
      final ServiceIcon? icon}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get status;
  @override
  String? get created_at;
  @override
  String? get has_two_location;
  @override
  ServiceIcon? get icon;
  @override
  @JsonKey(ignore: true)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceIcon _$ServiceIconFromJson(Map<String, dynamic> json) {
  return _ServiceIcon.fromJson(json);
}

/// @nodoc
mixin _$ServiceIcon {
  int? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceIconCopyWith<ServiceIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceIconCopyWith<$Res> {
  factory $ServiceIconCopyWith(
          ServiceIcon value, $Res Function(ServiceIcon) then) =
      _$ServiceIconCopyWithImpl<$Res, ServiceIcon>;
  @useResult
  $Res call({int? id, String? url, String? type});
}

/// @nodoc
class _$ServiceIconCopyWithImpl<$Res, $Val extends ServiceIcon>
    implements $ServiceIconCopyWith<$Res> {
  _$ServiceIconCopyWithImpl(this._value, this._then);

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
abstract class _$$ServiceIconImplCopyWith<$Res>
    implements $ServiceIconCopyWith<$Res> {
  factory _$$ServiceIconImplCopyWith(
          _$ServiceIconImpl value, $Res Function(_$ServiceIconImpl) then) =
      __$$ServiceIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? url, String? type});
}

/// @nodoc
class __$$ServiceIconImplCopyWithImpl<$Res>
    extends _$ServiceIconCopyWithImpl<$Res, _$ServiceIconImpl>
    implements _$$ServiceIconImplCopyWith<$Res> {
  __$$ServiceIconImplCopyWithImpl(
      _$ServiceIconImpl _value, $Res Function(_$ServiceIconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? type = freezed,
  }) {
    return _then(_$ServiceIconImpl(
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
class _$ServiceIconImpl implements _ServiceIcon {
  const _$ServiceIconImpl({this.id, this.url, this.type});

  factory _$ServiceIconImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceIconImplFromJson(json);

  @override
  final int? id;
  @override
  final String? url;
  @override
  final String? type;

  @override
  String toString() {
    return 'ServiceIcon(id: $id, url: $url, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceIconImpl &&
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
  _$$ServiceIconImplCopyWith<_$ServiceIconImpl> get copyWith =>
      __$$ServiceIconImplCopyWithImpl<_$ServiceIconImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceIconImplToJson(
      this,
    );
  }
}

abstract class _ServiceIcon implements ServiceIcon {
  const factory _ServiceIcon(
      {final int? id,
      final String? url,
      final String? type}) = _$ServiceIconImpl;

  factory _ServiceIcon.fromJson(Map<String, dynamic> json) =
      _$ServiceIconImpl.fromJson;

  @override
  int? get id;
  @override
  String? get url;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$ServiceIconImplCopyWith<_$ServiceIconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
