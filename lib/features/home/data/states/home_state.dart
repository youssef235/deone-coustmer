import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/home_response.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(ServicesResponse(services: [], slides: []))
    ServicesResponse servicesResponse,
    @Default(null) String? errorMessage,
    @Default(null) List<Service>? mainServices,
    @Default(null) List<String>? sliders,
    @Default(null) List<Service>? subServices,

    // @Default(true) bool loading,
    @Default(true) bool mainServiceLoading,
    @Default(true) bool subServiceLoading,
    @Default(true) bool slidersServiceLoading,
    @Default(0) int screenIndex,
  }) = _HomeState;
}
//https://chat.openai.com/share/e9e39b24-d9c9-42b1-af3b-93f78a3bff06