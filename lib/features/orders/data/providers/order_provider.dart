import 'dart:developer';

import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:translator/translator.dart';

import '../repositories/order_repository.dart';
import '../states/order_state.dart';

class OrderNotifierProvider extends StateNotifier<OrderState> {
  OrderNotifierProvider(this.orderRepository) : super(const OrderState());

  final OrderRepository orderRepository;

  getOrderData() async {
    try {
      if (state.orderResponse.projects!.isEmpty &&
          state.notActiveOrderResponse.projects!.isEmpty) {
        state = state.copyWith(loading: true);
      }
      final OrderResponse orderResponse =
          await orderRepository.fetchOrderData('opened,progress,under_review');
      final OrderResponse notActiveOrderResponse =
          await orderRepository.fetchOrderData('completed,cancelled');
      state = state.copyWith(
          orderResponse: orderResponse,
          notActiveOrderResponse: notActiveOrderResponse,
          loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  getUserNotificationsData() async {
    try {
      if (state.notifications.isEmpty) {
        state = state.copyWith(loading: true);
      }
      final notifications = await orderRepository.fetchUserNotificationsData();
      state = state.copyWith(notifications: notifications, loading: false);
    } catch (e) {
      log(e.toString(), name: 'notifications');
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  getActiveProposal(int id) async {
    try {
      state = state.copyWith(getProposalLoading: true);
      final List<Proposals> proposals =
          await orderRepository.fetchProposalData(id);
      state = state.copyWith(proposals: proposals, getProposalLoading: false);
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  cancelProposal(int id, String note) async {
    try {
      state = state.copyWith(loading: true);
      final String status = await orderRepository.cancelProposal(id, note);
      state = state.copyWith(loading: false);
      return status;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return null;
    }
  }

  cancelProject(int id, String note) async {
    try {
      state = state.copyWith(loading: true);
      final String status = await orderRepository.cancelProject(id, note);
      state = state.copyWith(loading: false);
      return status;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return null;
    }
  }

  acceptProposal(int id) async {
    try {
      state = state.copyWith(loading: true);
      final String status = await orderRepository.acceptProposal(id);
      state = state.copyWith(loading: false);
      return status;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  getProposal(int id) async {
    try {
      state = state.copyWith(loading: true);
      final proposal = await orderRepository.getProposal(id);
      state = state.copyWith(loading: false);
      return proposal;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  refuseProposal(int id) async {
    try {
      state = state.copyWith(loading: true);
      final String status = await orderRepository.refuseProposal(id);
      state = state.copyWith(loading: false);
      return status;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return null;
    }
  }

  rateProvider(
      int project_id, int provider_id, int rate, String comment) async {
    try {
      state = state.copyWith(loading: true);
      final String status = await orderRepository.rateProvider(
          project_id, provider_id, rate, comment);
      state = state.copyWith(loading: false);
      return status;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return null;
    }
  }

  getReviews(int provider_id) async {
    try {
      state = state.copyWith(loading: true);
      final status = await orderRepository.getReviews(provider_id);
      state = state.copyWith(loading: false);
      return status;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return null;
    }
  }

  getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      state = state.copyWith(proposalLoading: true);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark firstPlacemark = placemarks.first;

        String address =
            "${firstPlacemark.subThoroughfare} ${firstPlacemark.thoroughfare}, "
            "${firstPlacemark.subLocality}, ${firstPlacemark.locality}, \n"
            "${firstPlacemark.administrativeArea}, ${firstPlacemark.postalCode}, ";

        state = state.copyWith(add: address, proposalLoading: false);
      } else {}
    } catch (e) {
      state = state.copyWith(proposalLoading: false);
    }
  }

  getDestinationAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      state = state.copyWith(proposalLoading: true);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark firstPlacemark = placemarks.first;

        String address =
            "${firstPlacemark.subThoroughfare} ${firstPlacemark.thoroughfare}, "
            "${firstPlacemark.subLocality}, ${firstPlacemark.locality}, \n"
            "${firstPlacemark.administrativeArea}, ${firstPlacemark.postalCode}, ";

        state = state.copyWith(destinationAdd: address, proposalLoading: false);
      } else {}
    } catch (e) {
      state = state.copyWith(proposalLoading: false);
    }
  }

  void resetErrorMessage() {
    state = state.copyWith(loading: false, errorMessage: "");
  }
}

final orderNotifierProvider =
    StateNotifierProvider<OrderNotifierProvider, OrderState>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);

  return OrderNotifierProvider(orderRepository);
});
