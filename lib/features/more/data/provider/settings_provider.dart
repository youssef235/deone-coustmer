
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasq/features/more/data/model/settings.dart';
import 'package:wasq/features/more/data/repository/settings_repository.dart';
import 'package:wasq/features/more/data/states/settings_state.dart';

enum SettingsStatus { active, waiting, error }

final settingsNotifierProvider =
    StateNotifierProvider<SettingsStateNotifier, SettingsState>((ref) {
  final repo = ref.watch(settingsRepositoryProvider);
  return SettingsStateNotifier(repo, null);
});

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  final SettingsRepository _repo;

  SettingsStateNotifier(this._repo,
      [Settings? state])
      : super(SettingsState());

  Future getSettings() async {
    if(state.settingsResponse==null) {
      state = state.copyWith(loading: true);
    }
    try {
      Settings res = await _repo.getSettings();
      state = state.copyWith(settingsResponse: res , loading: false);
      return res;
    } catch (e) {
      state = state.copyWith(loading: false , errorMessage: e.toString());
    }
  }

}