// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderState {
  OrderResponse get orderResponse => throw _privateConstructorUsedError;
  OrderResponse get notActiveOrderResponse =>
      throw _privateConstructorUsedError;
  List<Notification> get notifications => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get proposalLoading => throw _privateConstructorUsedError;
  bool get getProposalLoading => throw _privateConstructorUsedError;
  List<Proposals> get proposals => throw _privateConstructorUsedError;
  String get add => throw _privateConstructorUsedError;
  String get destinationAdd => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call(
      {OrderResponse orderResponse,
      OrderResponse notActiveOrderResponse,
      List<Notification> notifications,
      bool loading,
      bool proposalLoading,
      bool getProposalLoading,
      List<Proposals> proposals,
      String add,
      String destinationAdd,
      String? errorMessage});

  $OrderResponseCopyWith<$Res> get orderResponse;
  $OrderResponseCopyWith<$Res> get notActiveOrderResponse;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderResponse = null,
    Object? notActiveOrderResponse = null,
    Object? notifications = null,
    Object? loading = null,
    Object? proposalLoading = null,
    Object? getProposalLoading = null,
    Object? proposals = null,
    Object? add = null,
    Object? destinationAdd = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      orderResponse: null == orderResponse
          ? _value.orderResponse
          : orderResponse // ignore: cast_nullable_to_non_nullable
              as OrderResponse,
      notActiveOrderResponse: null == notActiveOrderResponse
          ? _value.notActiveOrderResponse
          : notActiveOrderResponse // ignore: cast_nullable_to_non_nullable
              as OrderResponse,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      proposalLoading: null == proposalLoading
          ? _value.proposalLoading
          : proposalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      getProposalLoading: null == getProposalLoading
          ? _value.getProposalLoading
          : getProposalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      proposals: null == proposals
          ? _value.proposals
          : proposals // ignore: cast_nullable_to_non_nullable
              as List<Proposals>,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAdd: null == destinationAdd
          ? _value.destinationAdd
          : destinationAdd // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderResponseCopyWith<$Res> get orderResponse {
    return $OrderResponseCopyWith<$Res>(_value.orderResponse, (value) {
      return _then(_value.copyWith(orderResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderResponseCopyWith<$Res> get notActiveOrderResponse {
    return $OrderResponseCopyWith<$Res>(_value.notActiveOrderResponse, (value) {
      return _then(_value.copyWith(notActiveOrderResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
          _$OrderStateImpl value, $Res Function(_$OrderStateImpl) then) =
      __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderResponse orderResponse,
      OrderResponse notActiveOrderResponse,
      List<Notification> notifications,
      bool loading,
      bool proposalLoading,
      bool getProposalLoading,
      List<Proposals> proposals,
      String add,
      String destinationAdd,
      String? errorMessage});

  @override
  $OrderResponseCopyWith<$Res> get orderResponse;
  @override
  $OrderResponseCopyWith<$Res> get notActiveOrderResponse;
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
      _$OrderStateImpl _value, $Res Function(_$OrderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderResponse = null,
    Object? notActiveOrderResponse = null,
    Object? notifications = null,
    Object? loading = null,
    Object? proposalLoading = null,
    Object? getProposalLoading = null,
    Object? proposals = null,
    Object? add = null,
    Object? destinationAdd = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$OrderStateImpl(
      orderResponse: null == orderResponse
          ? _value.orderResponse
          : orderResponse // ignore: cast_nullable_to_non_nullable
              as OrderResponse,
      notActiveOrderResponse: null == notActiveOrderResponse
          ? _value.notActiveOrderResponse
          : notActiveOrderResponse // ignore: cast_nullable_to_non_nullable
              as OrderResponse,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      proposalLoading: null == proposalLoading
          ? _value.proposalLoading
          : proposalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      getProposalLoading: null == getProposalLoading
          ? _value.getProposalLoading
          : getProposalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      proposals: null == proposals
          ? _value._proposals
          : proposals // ignore: cast_nullable_to_non_nullable
              as List<Proposals>,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAdd: null == destinationAdd
          ? _value.destinationAdd
          : destinationAdd // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl(
      {this.orderResponse = const OrderResponse(projects: []),
      this.notActiveOrderResponse = const OrderResponse(projects: []),
      final List<Notification> notifications = const [],
      this.loading = false,
      this.proposalLoading = false,
      this.getProposalLoading = false,
      final List<Proposals> proposals = const [],
      this.add = "",
      this.destinationAdd = "",
      this.errorMessage = null})
      : _notifications = notifications,
        _proposals = proposals;

  @override
  @JsonKey()
  final OrderResponse orderResponse;
  @override
  @JsonKey()
  final OrderResponse notActiveOrderResponse;
  final List<Notification> _notifications;
  @override
  @JsonKey()
  List<Notification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool proposalLoading;
  @override
  @JsonKey()
  final bool getProposalLoading;
  final List<Proposals> _proposals;
  @override
  @JsonKey()
  List<Proposals> get proposals {
    if (_proposals is EqualUnmodifiableListView) return _proposals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proposals);
  }

  @override
  @JsonKey()
  final String add;
  @override
  @JsonKey()
  final String destinationAdd;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'OrderState(orderResponse: $orderResponse, notActiveOrderResponse: $notActiveOrderResponse, notifications: $notifications, loading: $loading, proposalLoading: $proposalLoading, getProposalLoading: $getProposalLoading, proposals: $proposals, add: $add, destinationAdd: $destinationAdd, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.orderResponse, orderResponse) ||
                other.orderResponse == orderResponse) &&
            (identical(other.notActiveOrderResponse, notActiveOrderResponse) ||
                other.notActiveOrderResponse == notActiveOrderResponse) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.proposalLoading, proposalLoading) ||
                other.proposalLoading == proposalLoading) &&
            (identical(other.getProposalLoading, getProposalLoading) ||
                other.getProposalLoading == getProposalLoading) &&
            const DeepCollectionEquality()
                .equals(other._proposals, _proposals) &&
            (identical(other.add, add) || other.add == add) &&
            (identical(other.destinationAdd, destinationAdd) ||
                other.destinationAdd == destinationAdd) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderResponse,
      notActiveOrderResponse,
      const DeepCollectionEquality().hash(_notifications),
      loading,
      proposalLoading,
      getProposalLoading,
      const DeepCollectionEquality().hash(_proposals),
      add,
      destinationAdd,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState implements OrderState {
  const factory _OrderState(
      {final OrderResponse orderResponse,
      final OrderResponse notActiveOrderResponse,
      final List<Notification> notifications,
      final bool loading,
      final bool proposalLoading,
      final bool getProposalLoading,
      final List<Proposals> proposals,
      final String add,
      final String destinationAdd,
      final String? errorMessage}) = _$OrderStateImpl;

  @override
  OrderResponse get orderResponse;
  @override
  OrderResponse get notActiveOrderResponse;
  @override
  List<Notification> get notifications;
  @override
  bool get loading;
  @override
  bool get proposalLoading;
  @override
  bool get getProposalLoading;
  @override
  List<Proposals> get proposals;
  @override
  String get add;
  @override
  String get destinationAdd;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
