import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../web_services/web_services.dart';
import 'package:path/path.dart' as path;

abstract class ServiceFormRepository {
  Stream<QuerySnapshot> getOffers(String pId);
  Future submitServiceForm({
    required DateTime date,
    required int service_id,
    required double lat,
    required double lang,
    required String description,
    required String? audioPath,
    required List<XFile?>? pickedImages,
    required XFile? pickedVideo,
    double? destinationLat,
    double? destinationLang,
  });
}

class ServiceFormRepositoryImpl implements ServiceFormRepository {
  @override
  Future submitServiceForm({
    required DateTime date,
    required int service_id,
    required double lat,
    required double lang,
    required String description,
    required String? audioPath,
    required List<XFile?>? pickedImages,
    required XFile? pickedVideo,
    double? destinationLat,
    double? destinationLang,
  }) async {
    try {
      List<MultipartFile> imageFiles = [];
      if (pickedImages != null) {
        for (XFile? imageFile in pickedImages) {
          if (imageFile != null) {
            File file = File(imageFile.path);
            imageFiles.add(await MultipartFile.fromFile(
              file.path,
              filename: path.basename(file.path),
            ));
          }
        }
      }

      FormData formData = FormData.fromMap({
        "available_time": date,
        "service_id": service_id,
        "location_lat": lat,
        "location_lang": lang,
        "from_lat": lat,
        "from_lng": lang,
        "to_lat": destinationLat,
        "to_lng": destinationLang,
        "description": description,
        if (audioPath != null)
          "attachments_audios[]": await MultipartFile.fromFile(
            audioPath,
            filename: "recorded_audio.aac",
          ),
        "attachments_images[]": imageFiles,
        "attachments_videos[]": pickedVideo != null
            ? [
                await MultipartFile.fromFile(
                  pickedVideo.path,
                  filename: path.basename(pickedVideo.path),
                )
              ]
            : [],
      });
      var response = await HttpClient.dio.post(
        EndPoints.requestService,
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
        // return response.data["status"];
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Stream<QuerySnapshot> getOffers(String pId) {
    print(FirebaseFirestore.instance
        .collection('Offers')
        .doc(pId)
        .collection('offers')
        .orderBy('price', descending: true)
        .snapshots()
        .toString());
    return FirebaseFirestore.instance
        .collection('Offers')
        .doc(pId)
        .collection('offers')
        .orderBy('price', descending: true)
        .snapshots();
  }
}

final serviceFormRepositoryProvider = Provider<ServiceFormRepository>((ref) {
  return ServiceFormRepositoryImpl();
});
