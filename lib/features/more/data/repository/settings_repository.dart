import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasq/features/invoice/data/model/invoice.dart';
import 'package:wasq/features/more/data/model/settings.dart';
import 'package:wasq/web_services/end_points.dart';
import 'package:wasq/web_services/http_client.dart';

abstract class SettingsRepository {
  Future getSettings();
  }

class SettingsRepositoryImpl implements SettingsRepository{


  @override
  Future getSettings() async {
    try {
      var response = await HttpClient.dio.get(EndPoints.settings, 
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
        }),);
        
        print("res ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Settings fromjson = Settings.fromJson(response.data['settings']);
        return fromjson;
        // return response.data["status"];
      } else {
        throw(response.data["message"]);
      }
    } catch (e) {
      throw(e.toString());
    }
  }
}

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl();
});
