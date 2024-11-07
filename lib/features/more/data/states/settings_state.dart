import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasq/features/more/data/model/settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(null) Settings? settingsResponse,
    @Default(false) bool loading,
    @Default(false) bool addLoading,
    @Default("") String add,
    @Default("") String errorMessage,
  }) = _SettingsState;
}
