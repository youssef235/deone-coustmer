// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceFormState {
  ServiceFormResponse get serviceFormResponse =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  double get destinationLat => throw _privateConstructorUsedError;
  double get destinationLang => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceFormStateCopyWith<ServiceFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceFormStateCopyWith<$Res> {
  factory $ServiceFormStateCopyWith(
          ServiceFormState value, $Res Function(ServiceFormState) then) =
      _$ServiceFormStateCopyWithImpl<$Res, ServiceFormState>;
  @useResult
  $Res call(
      {ServiceFormResponse serviceFormResponse,
      String? errorMessage,
      bool loading,
      double destinationLat,
      double destinationLang});

  $ServiceFormResponseCopyWith<$Res> get serviceFormResponse;
}

/// @nodoc
class _$ServiceFormStateCopyWithImpl<$Res, $Val extends ServiceFormState>
    implements $ServiceFormStateCopyWith<$Res> {
  _$ServiceFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceFormResponse = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? destinationLat = null,
    Object? destinationLang = null,
  }) {
    return _then(_value.copyWith(
      serviceFormResponse: null == serviceFormResponse
          ? _value.serviceFormResponse
          : serviceFormResponse // ignore: cast_nullable_to_non_nullable
              as ServiceFormResponse,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      destinationLat: null == destinationLat
          ? _value.destinationLat
          : destinationLat // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLang: null == destinationLang
          ? _value.destinationLang
          : destinationLang // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceFormResponseCopyWith<$Res> get serviceFormResponse {
    return $ServiceFormResponseCopyWith<$Res>(_value.serviceFormResponse,
        (value) {
      return _then(_value.copyWith(serviceFormResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceFormStateImplCopyWith<$Res>
    implements $ServiceFormStateCopyWith<$Res> {
  factory _$$ServiceFormStateImplCopyWith(_$ServiceFormStateImpl value,
          $Res Function(_$ServiceFormStateImpl) then) =
      __$$ServiceFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ServiceFormResponse serviceFormResponse,
      String? errorMessage,
      bool loading,
      double destinationLat,
      double destinationLang});

  @override
  $ServiceFormResponseCopyWith<$Res> get serviceFormResponse;
}

/// @nodoc
class __$$ServiceFormStateImplCopyWithImpl<$Res>
    extends _$ServiceFormStateCopyWithImpl<$Res, _$ServiceFormStateImpl>
    implements _$$ServiceFormStateImplCopyWith<$Res> {
  __$$ServiceFormStateImplCopyWithImpl(_$ServiceFormStateImpl _value,
      $Res Function(_$ServiceFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceFormResponse = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? destinationLat = null,
    Object? destinationLang = null,
  }) {
    return _then(_$ServiceFormStateImpl(
      serviceFormResponse: null == serviceFormResponse
          ? _value.serviceFormResponse
          : serviceFormResponse // ignore: cast_nullable_to_non_nullable
              as ServiceFormResponse,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      destinationLat: null == destinationLat
          ? _value.destinationLat
          : destinationLat // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLang: null == destinationLang
          ? _value.destinationLang
          : destinationLang // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ServiceFormStateImpl implements _ServiceFormState {
  const _$ServiceFormStateImpl(
      {this.serviceFormResponse = const ServiceFormResponse(districts: []),
      this.errorMessage = null,
      this.loading = false,
      this.destinationLat = 0,
      this.destinationLang = 0});

  @override
  @JsonKey()
  final ServiceFormResponse serviceFormResponse;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final double destinationLat;
  @override
  @JsonKey()
  final double destinationLang;

  @override
  String toString() {
    return 'ServiceFormState(serviceFormResponse: $serviceFormResponse, errorMessage: $errorMessage, loading: $loading, destinationLat: $destinationLat, destinationLang: $destinationLang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceFormStateImpl &&
            (identical(other.serviceFormResponse, serviceFormResponse) ||
                other.serviceFormResponse == serviceFormResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.destinationLat, destinationLat) ||
                other.destinationLat == destinationLat) &&
            (identical(other.destinationLang, destinationLang) ||
                other.destinationLang == destinationLang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceFormResponse,
      errorMessage, loading, destinationLat, destinationLang);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceFormStateImplCopyWith<_$ServiceFormStateImpl> get copyWith =>
      __$$ServiceFormStateImplCopyWithImpl<_$ServiceFormStateImpl>(
          this, _$identity);
}

abstract class _ServiceFormState implements ServiceFormState {
  const factory _ServiceFormState(
      {final ServiceFormResponse serviceFormResponse,
      final String? errorMessage,
      final bool loading,
      final double destinationLat,
      final double destinationLang}) = _$ServiceFormStateImpl;

  @override
  ServiceFormResponse get serviceFormResponse;
  @override
  String? get errorMessage;
  @override
  bool get loading;
  @override
  double get destinationLat;
  @override
  double get destinationLang;
  @override
  @JsonKey(ignore: true)
  _$$ServiceFormStateImplCopyWith<_$ServiceFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
