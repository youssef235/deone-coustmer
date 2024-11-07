import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/home_response.dart';
import '../repositories/home_repository.dart';
import '../states/home_state.dart';

int? numberOfService;

class HomeNotifierProvider extends StateNotifier<HomeState> {
  HomeNotifierProvider(this.homeRepository) : super(const HomeState()) {
    init();
  }

  final HomeRepository homeRepository;

  init() {
    getSliders();
  }

  getSliders() async {
    try {
      state = state.copyWith(slidersServiceLoading: true);
      final List<String> sliders = await homeRepository.getSliders();
      state = state.copyWith(sliders: sliders, slidersServiceLoading: false);
    } catch (e) {
      state = state.copyWith(
          slidersServiceLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> getMainServices() async {
    state = state.copyWith(mainServiceLoading: true);
    try {
      final mainServices = await homeRepository.fetchMainServices();

      numberOfService = mainServices.length;

      state =
          state.copyWith(mainServices: mainServices, mainServiceLoading: false);
    } catch (e) {
      state =
          state.copyWith(mainServiceLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> getSubServices(int parentId) async {
    state = state.copyWith(subServiceLoading: true);
    try {
      final subServices = await homeRepository.fetchSubServices(parentId);

      state =
          state.copyWith(subServices: subServices, subServiceLoading: false);
    } catch (e) {
      state =
          state.copyWith(subServiceLoading: false, errorMessage: e.toString());
    }
  }

  changePageIndex(index) {
    state = state.copyWith(screenIndex: index);
  }
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifierProvider, HomeState>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);

  return HomeNotifierProvider(homeRepository);
});
