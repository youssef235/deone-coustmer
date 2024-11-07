import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../web_services/web_services.dart';

abstract class OrderRepository {
  Future<OrderResponse> fetchOrderData(String status);
  Future<String> refuseProposal(int id);
  Future<String> acceptProposal(int id);
  Future<String> cancelProposal(int id, String note);
  Future<String> cancelProject(int id, String note);
  Future<String> rateProvider(
      int project_id, int provider_id, int rate, String review);
  Future<List<Review>> getReviews(int id);
  Future<Proposals> getProposal(int id);
  Future<List<Notification>> fetchUserNotificationsData();
  Future<List<Proposals>> fetchProposalData(int id);
}

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<OrderResponse> fetchOrderData(String status) async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.projects(status: status),
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return OrderResponse.fromJson(response.data["projects"]);
      }

      return const OrderResponse();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> refuseProposal(int id) async {
    try {
      var response = await HttpClient.dio.post(
        EndPoints.refuseProposals(id: id),
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["status"];
      }
      return "حدث خطأ ما";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> acceptProposal(int id) async {
    try {
      var response = await HttpClient.dio.post(
        EndPoints.acceptProposals(id: id),
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["status"];
      }
      return "حدث خطأ ما";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> rateProvider(
      int project_id, int provider_id, int rate, String review) async {
    try {
      var data = {
        "project_id": project_id,
        "provider_id": provider_id,
        "rate": rate,
        "review": review,
      };
      var response = await HttpClient.dio.post(
        EndPoints.rateProvider,
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );

      return response.data["message"];
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return response.data["status"];
      // }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Proposals>> fetchProposalData(int id) async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.proposals(id: id),
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = response.data['proposals'] as List;
        List<Proposals> rez = res.map((e) => Proposals.fromJson(e)).toList();
        return rez;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Review>> getReviews(int id) async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.getReviews(id: id),
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = response.data['reviews']["data"]
            as List; //.map((data)=>Review.fromJson(data)) as List<Review>;
        List<Review> rez = res.map((e) => Review.fromJson(e)).toList();
        return rez;
        // return Review.fromJson()
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> cancelProposal(int id, String note) async {
    try {
      var data = {"note": note};
      var response = await HttpClient.dio.post(
        EndPoints.cancelProposals(id: id),
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["status"];
      }
      return "حدث خطأ ما";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Proposals> getProposal(int id) async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.getProposal(id: id),
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Proposals.fromJson(response.data["proposal"]);
      }
      return const Proposals();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> cancelProject(int id, String note) async {
    try {
      var data = {"note": note, "status": "cancelled"};
      var response = await HttpClient.dio.put(
        EndPoints.updateProject(id: id),
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["message"];
      }
      return "حدث خطأ ما";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Notification>> fetchUserNotificationsData() {
    try {
      var response = HttpClient.dio.get(
        EndPoints.getUserNotification,
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      return response.then((value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          var res = value.data['notifications']['data'] as List;
          List<Notification> rez =
              res.map((e) => Notification.fromJson(e)).toList();
          return rez;
        }
        return [];
      });
    } catch (e) {
      rethrow;
    }
  }
}

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl();
});
