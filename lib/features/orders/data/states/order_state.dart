import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default(OrderResponse(projects: [])) OrderResponse orderResponse,
    @Default(OrderResponse(projects: [])) OrderResponse notActiveOrderResponse,
    @Default([]) List<Notification> notifications,
    @Default(false) bool loading,
    @Default(false) bool proposalLoading,
    @Default(false) bool getProposalLoading,
    @Default([]) List<Proposals> proposals,
    @Default("") String add,
    @Default("") String destinationAdd,
    @Default(null) String? errorMessage,
  }) = _OrderState;
}
