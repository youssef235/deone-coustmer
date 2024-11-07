// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  ServicesResponse get servicesResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<Service>? get mainServices => throw _privateConstructorUsedError;
  List<String>? get sliders => throw _privateConstructorUsedError;
  List<Service>? get subServices =>
      throw _privateConstructorUsedError; // @Default(true) bool loading,
  bool get mainServiceLoading => throw _privateConstructorUsedError;
  bool get subServiceLoading => throw _privateConstructorUsedError;
  bool get slidersServiceLoading => throw _privateConstructorUsedError;
  int get screenIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {ServicesResponse servicesResponse,
      String? errorMessage,
      List<Service>? mainServices,
      List<String>? sliders,
      List<Service>? subServices,
      bool mainServiceLoading,
      bool subServiceLoading,
      bool slidersServiceLoading,
      int screenIndex});

  $ServicesResponseCopyWith<$Res> get servicesResponse;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesResponse = null,
    Object? errorMessage = freezed,
    Object? mainServices = freezed,
    Object? sliders = freezed,
    Object? subServices = freezed,
    Object? mainServiceLoading = null,
    Object? subServiceLoading = null,
    Object? slidersServiceLoading = null,
    Object? screenIndex = null,
  }) {
    return _then(_value.copyWith(
      servicesResponse: null == servicesResponse
          ? _value.servicesResponse
          : servicesResponse // ignore: cast_nullable_to_non_nullable
              as ServicesResponse,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      mainServices: freezed == mainServices
          ? _value.mainServices
          : mainServices // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      sliders: freezed == sliders
          ? _value.sliders
          : sliders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subServices: freezed == subServices
          ? _value.subServices
          : subServices // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      mainServiceLoading: null == mainServiceLoading
          ? _value.mainServiceLoading
          : mainServiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      subServiceLoading: null == subServiceLoading
          ? _value.subServiceLoading
          : subServiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      slidersServiceLoading: null == slidersServiceLoading
          ? _value.slidersServiceLoading
          : slidersServiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      screenIndex: null == screenIndex
          ? _value.screenIndex
          : screenIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServicesResponseCopyWith<$Res> get servicesResponse {
    return $ServicesResponseCopyWith<$Res>(_value.servicesResponse, (value) {
      return _then(_value.copyWith(servicesResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ServicesResponse servicesResponse,
      String? errorMessage,
      List<Service>? mainServices,
      List<String>? sliders,
      List<Service>? subServices,
      bool mainServiceLoading,
      bool subServiceLoading,
      bool slidersServiceLoading,
      int screenIndex});

  @override
  $ServicesResponseCopyWith<$Res> get servicesResponse;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesResponse = null,
    Object? errorMessage = freezed,
    Object? mainServices = freezed,
    Object? sliders = freezed,
    Object? subServices = freezed,
    Object? mainServiceLoading = null,
    Object? subServiceLoading = null,
    Object? slidersServiceLoading = null,
    Object? screenIndex = null,
  }) {
    return _then(_$HomeStateImpl(
      servicesResponse: null == servicesResponse
          ? _value.servicesResponse
          : servicesResponse // ignore: cast_nullable_to_non_nullable
              as ServicesResponse,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      mainServices: freezed == mainServices
          ? _value._mainServices
          : mainServices // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      sliders: freezed == sliders
          ? _value._sliders
          : sliders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subServices: freezed == subServices
          ? _value._subServices
          : subServices // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      mainServiceLoading: null == mainServiceLoading
          ? _value.mainServiceLoading
          : mainServiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      subServiceLoading: null == subServiceLoading
          ? _value.subServiceLoading
          : subServiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      slidersServiceLoading: null == slidersServiceLoading
          ? _value.slidersServiceLoading
          : slidersServiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      screenIndex: null == screenIndex
          ? _value.screenIndex
          : screenIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.servicesResponse = const ServicesResponse(services: [], slides: []),
      this.errorMessage = null,
      final List<Service>? mainServices = null,
      final List<String>? sliders = null,
      final List<Service>? subServices = null,
      this.mainServiceLoading = true,
      this.subServiceLoading = true,
      this.slidersServiceLoading = true,
      this.screenIndex = 0})
      : _mainServices = mainServices,
        _sliders = sliders,
        _subServices = subServices;

  @override
  @JsonKey()
  final ServicesResponse servicesResponse;
  @override
  @JsonKey()
  final String? errorMessage;
  final List<Service>? _mainServices;
  @override
  @JsonKey()
  List<Service>? get mainServices {
    final value = _mainServices;
    if (value == null) return null;
    if (_mainServices is EqualUnmodifiableListView) return _mainServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _sliders;
  @override
  @JsonKey()
  List<String>? get sliders {
    final value = _sliders;
    if (value == null) return null;
    if (_sliders is EqualUnmodifiableListView) return _sliders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Service>? _subServices;
  @override
  @JsonKey()
  List<Service>? get subServices {
    final value = _subServices;
    if (value == null) return null;
    if (_subServices is EqualUnmodifiableListView) return _subServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// @Default(true) bool loading,
  @override
  @JsonKey()
  final bool mainServiceLoading;
  @override
  @JsonKey()
  final bool subServiceLoading;
  @override
  @JsonKey()
  final bool slidersServiceLoading;
  @override
  @JsonKey()
  final int screenIndex;

  @override
  String toString() {
    return 'HomeState(servicesResponse: $servicesResponse, errorMessage: $errorMessage, mainServices: $mainServices, sliders: $sliders, subServices: $subServices, mainServiceLoading: $mainServiceLoading, subServiceLoading: $subServiceLoading, slidersServiceLoading: $slidersServiceLoading, screenIndex: $screenIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.servicesResponse, servicesResponse) ||
                other.servicesResponse == servicesResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._mainServices, _mainServices) &&
            const DeepCollectionEquality().equals(other._sliders, _sliders) &&
            const DeepCollectionEquality()
                .equals(other._subServices, _subServices) &&
            (identical(other.mainServiceLoading, mainServiceLoading) ||
                other.mainServiceLoading == mainServiceLoading) &&
            (identical(other.subServiceLoading, subServiceLoading) ||
                other.subServiceLoading == subServiceLoading) &&
            (identical(other.slidersServiceLoading, slidersServiceLoading) ||
                other.slidersServiceLoading == slidersServiceLoading) &&
            (identical(other.screenIndex, screenIndex) ||
                other.screenIndex == screenIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      servicesResponse,
      errorMessage,
      const DeepCollectionEquality().hash(_mainServices),
      const DeepCollectionEquality().hash(_sliders),
      const DeepCollectionEquality().hash(_subServices),
      mainServiceLoading,
      subServiceLoading,
      slidersServiceLoading,
      screenIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final ServicesResponse servicesResponse,
      final String? errorMessage,
      final List<Service>? mainServices,
      final List<String>? sliders,
      final List<Service>? subServices,
      final bool mainServiceLoading,
      final bool subServiceLoading,
      final bool slidersServiceLoading,
      final int screenIndex}) = _$HomeStateImpl;

  @override
  ServicesResponse get servicesResponse;
  @override
  String? get errorMessage;
  @override
  List<Service>? get mainServices;
  @override
  List<String>? get sliders;
  @override
  List<Service>? get subServices;
  @override // @Default(true) bool loading,
  bool get mainServiceLoading;
  @override
  bool get subServiceLoading;
  @override
  bool get slidersServiceLoading;
  @override
  int get screenIndex;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
