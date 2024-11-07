// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// class Moyasaar {
//   final paymentUrl = "https://api.moyasar.com/v1/payments";
//   static const username = "sk_live_6soDMemjcM91dRT9yECycz3t8Pedt2WTwCgPjxNB"; // استخدم Basic Auth
//
//   String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:'))}';
//
//   Future<String?> stc_pay(int amount, String phone) async {
//     var headers = <String, String>{
//       'Content-type': 'application/json',
//       'Authorization': 'Basic ${base64Encode(utf8.encode(username + ':'))}'
//     };
//
//     var data = {
//       "amount": amount,
//       "currency": "SAR",
//       "callback_url": "https://www.google.com",
//       "source": {
//         "type": "stcpay",
//         "mobile": phone
//       }
//     };
//
//     try {
//       // إرسال الطلب
//       http.Response res = await http.post(Uri.parse(paymentUrl),
//           body: json.encode(data), headers: headers);
//
//       // التحقق من الحالة وطباعة المزيد من التفاصيل عند وجود خطأ
//       if (res.statusCode == 200) {
//         print("الدفع ناجح: ${res.body}");
//         return res.body; // إعادة رابط الدفع
//       } else {
//         print("خطأ في عملية الدفع: ${res.statusCode}");
//         print("تفاصيل الخطأ: ${res.body}");
//         return null;
//       }
//     } catch (e) {
//       print("استثناء أثناء الدفع: $e");
//       return null;
//     }
//   }
//
// }
