import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasq/features/invoice/data/model/invoice.dart';
import 'package:wasq/web_services/end_points.dart';
import 'package:wasq/web_services/http_client.dart';

abstract class InvoiceRepository {
  Future<Invoice> getInvoice(int project_id);
  Future getInvoicePdf(int invoice_id);
  Future paymentsApprove({required String transaction_id, String? project_id});
  Future<String> createPayment({
    required int invoiceID,
    String orderID,
    String name,
    String? paymentMethod,
  });
}

class InvoiceRepositoryImpl implements InvoiceRepository {
  @override
  Future<Invoice> getInvoice(int project_id) async {
    try {
      print("Requesting invoice for project_id: $project_id"); // تحقق من قيمة project_id

      var response = await HttpClient.dio.post(
        EndPoints.getInvoice(),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          validateStatus: (status) {
            return status! < 500; // قبول الاستجابات التي تحتوي على خطأ (4xx)
          },
        ),
        data: {"project_id": project_id},
      );

      print("Response status code: ${response.statusCode}");
      print("Response data: ${response.data}");



      print(response.data); // طباعة محتوى الاستجابة

      if (response.statusCode == 200 || response.statusCode == 201) {
        Invoice fromjson = Invoice.fromJson(response.data['invoice']);
        return fromjson;
      } else {
        throw ("Error: ${response.statusCode} - ${response.data["message"] ?? 'Unknown error'}");
      }
    } catch (e) {
      print("Error occurred: $e"); // طباعة الخطأ
      throw (e.toString());
    }
  }


  @override
  Future getInvoicePdf(int invoice_id) async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.getInvoicePdf(invoiceId: invoice_id),
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        print("##############################");
        // Invoice fromjson = Invoice.fromJson(response.data['invoice']);
        // fromjson.pdf =
        return response.data['pdf'];
        // return response.data["status"];
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future paymentsApprove(
      {required String transaction_id, String? project_id}) async {
    var data = {"project_id": project_id, "transaction_id": transaction_id};
    try {
      var response = await HttpClient.dio.post(
        EndPoints.paymentsApprove,
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {}
  }

  @override
  Future<String> createPayment({
    required int invoiceID,
    String? orderID,
    String? name,
    String? paymentMethod,
  }) async {
    try {
      var data = {
        'orderID': orderID,
        'name': name,
      };
      if (paymentMethod != null) {
        data['payment_methods'] = paymentMethod;
      }

      var response = await HttpClient.dio.post(
          EndPoints.createPayment(invoiceId: invoiceID),
          options: Options(headers: {
            "Accept": "application/json",
          }),
          data: data
      );

      log("Payment Method: $paymentMethod", name: 'PaymentMethod');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final url = response.data['result']['invoice_getaway']['url'];
        print("Payment URL: $url");
        return url;
      } else {
        print("Error Response: ${response.data}"); // طباعة تفاصيل الخطأ
        throw (response.data["message"]);
      }
    } catch (e) {
      print("Error: $e");
      throw (e.toString());
    }
  }

}

final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  return InvoiceRepositoryImpl();
});
