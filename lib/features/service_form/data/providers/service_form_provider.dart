import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../repositories/service_form_repository.dart';
import '../states/service_form_state.dart';

class ServiceFormNotifierProvider extends StateNotifier<ServiceFormState> {
  ServiceFormNotifierProvider(this.serviceFormRepository)
      : super(const ServiceFormState()) {}

  final ServiceFormRepository serviceFormRepository;

  submitServiceForm({
    required DateTime date,
    required int service_id,
    required double lat,
    required double lang,
    double? destinationLat,
    double? destinationLang,
    required String description,
    required String? audioPath,
    required List<XFile?>? pickedImages,
    required XFile? pickedVideo,
  }) async {
    try {
      state = state.copyWith(loading: true);
      var res = await serviceFormRepository.submitServiceForm(
          date: date,
          service_id: service_id,
          lat: lat,
          lang: lang,
          description: description,
          audioPath: audioPath,
          pickedImages: pickedImages,
          pickedVideo: pickedVideo,
          destinationLat: destinationLat,
          destinationLang: destinationLang);
      // res = json.decode(res);

      state = state.copyWith(loading: false);

      return res;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  Stream<QuerySnapshot> getOffers(int pId) {
    try {
      return serviceFormRepository.getOffers(pId.toString());
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const Stream.empty();
    }
  }

  void resetErrorMessage() {
    state = state.copyWith(loading: false, errorMessage: "");
  }

  setDestinationLocation({required double lat, required double lang}) {
    state = state.copyWith(destinationLang: lang, destinationLat: lat);
  }
}

final serviceFormNotifierProvider =
    StateNotifierProvider<ServiceFormNotifierProvider, ServiceFormState>((ref) {
  final serviceFormRepository = ref.watch(serviceFormRepositoryProvider);

  return ServiceFormNotifierProvider(serviceFormRepository);
});
