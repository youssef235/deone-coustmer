// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  Settings? get settingsResponse => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get addLoading => throw _privateConstructorUsedError;
  String get add => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {Settings? settingsResponse,
      bool loading,
      bool addLoading,
      String add,
      String errorMessage});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsResponse = freezed,
    Object? loading = null,
    Object? addLoading = null,
    Object? add = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      settingsResponse: freezed == settingsResponse
          ? _value.settingsResponse
          : settingsResponse // ignore: cast_nullable_to_non_nullable
              as Settings?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      addLoading: null == addLoading
          ? _value.addLoading
          : addLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Settings? settingsResponse,
      bool loading,
      bool addLoading,
      String add,
      String errorMessage});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsResponse = freezed,
    Object? loading = null,
    Object? addLoading = null,
    Object? add = null,
    Object? errorMessage = null,
  }) {
    return _then(_$SettingsStateImpl(
      settingsResponse: freezed == settingsResponse
          ? _value.settingsResponse
          : settingsResponse // ignore: cast_nullable_to_non_nullable
              as Settings?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      addLoading: null == addLoading
          ? _value.addLoading
          : addLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {this.settingsResponse = null,
      this.loading = false,
      this.addLoading = false,
      this.add = "",
      this.errorMessage = ""});

  @override
  @JsonKey()
  final Settings? settingsResponse;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool addLoading;
  @override
  @JsonKey()
  final String add;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'SettingsState(settingsResponse: $settingsResponse, loading: $loading, addLoading: $addLoading, add: $add, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.settingsResponse, settingsResponse) ||
                other.settingsResponse == settingsResponse) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.addLoading, addLoading) ||
                other.addLoading == addLoading) &&
            (identical(other.add, add) || other.add == add) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, settingsResponse, loading, addLoading, add, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {final Settings? settingsResponse,
      final bool loading,
      final bool addLoading,
      final String add,
      final String errorMessage}) = _$SettingsStateImpl;

  @override
  Settings? get settingsResponse;
  @override
  bool get loading;
  @override
  bool get addLoading;
  @override
  String get add;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
