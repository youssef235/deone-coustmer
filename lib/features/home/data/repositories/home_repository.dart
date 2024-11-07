import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wasq/features/home/data/providers/home_provider.dart';

import '../../../../web_services/web_services.dart';
import '../models/home_response.dart';

abstract class HomeRepository {
  Future<List<String>> getSliders();
  Future<List<Service>> fetchMainServices();
  Future<List<Service>> fetchSubServices(int parentId);
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<String>> getSliders() async {
    try {
      var slidesResponse = await HttpClient.dio.get(
        EndPoints.slides,
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      List<String> slides = [];

      if (slidesResponse.statusCode == 200) {
        if (slidesResponse.data.containsKey('slides')) {
          slides = List<String>.from(slidesResponse.data['slides']);

          print("asdasdasdaafffaasssssssd ${slides}");
        }
      }

      return slides;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Service>> fetchMainServices() async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.allServices,
        queryParameters: {'type': 'parent'},
        options: Options(headers: {"Accept": "application/json"}),
      );

      if (response.statusCode == 200) {
        List<Service> mainServices = [];

        // Check if the 'services' key exists in the response data
        if (response.data.containsKey('services')) {
          mainServices = (response.data['services'] as List)
              .map((item) => Service.fromJson(item))
              .toList();
        }

        numberOfService = mainServices.length;

        print("Main Services: $mainServices");
        return mainServices;
      } else {
        throw Exception('Failed to load main services');
      }
    } catch (e) {
      print("Error fetching main services: $e");
      rethrow;
    }
  }

  @override
  Future<List<Service>> fetchSubServices(int parentId) async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.allServices,
        queryParameters: {'type': 'child', 'parent_id': parentId},
        options: Options(headers: {"Accept": "application/json"}),
      );

      if (response.statusCode == 200) {
        List<Service> subServices = [];

        // Check if the response data is a List
        // Check if the 'services' key exists in the response data
        if (response.data.containsKey('services')) {
          subServices = (response.data['services'] as List)
              .map((item) => Service.fromJson(item))
              .toList();
        }

        print("tttttttttt $subServices");
        return subServices;
      } else {
        throw Exception('Failed to load sub services');
      }
    } catch (e) {
      print("Error fetching sub services: $e");
      rethrow;
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
