// import 'package:flutter/material.dart';
// import 'package:moyasar/moyasar.dart';
//
// class CoffeeShop extends StatefulWidget {
//   const CoffeeShop({super.key});
//
//   @override
//   State<CoffeeShop> createState() => _CoffeeShopState();
// }
//
// class _CoffeeShopState extends State<CoffeeShop> {
//   final paymentConfig = PaymentConfig(
//     publishableApiKey: 'pk_test_r6eZg85QyduWZ7PNTHT56BFvZpxJgNJ2PqPMDoXA',
//     amount: 100, // SAR 1
//     description: 'order #1324',
//     metadata: {'size': '250g', 'code': 255},
//     creditCard: CreditCardConfig(saveCard: false, manual: false),
//     applePay: ApplePayConfig(
//       merchantId: 'merchant.mysr.fghurayri',
//       label: 'Blue Coffee Beans',
//       manual: false,
//     ),
//   );
//
//   void onPaymentResult(result) {
//     if (result is PaymentResponse) {
//       showToast(context, result.status.name);
//       switch (result.status) {
//         case PaymentStatus.paid:
//         // handle success.
//           break;
//         case PaymentStatus.failed:
//         // handle failure.
//           break;
//         case PaymentStatus.authorized:
//         // handle authorized.
//           break;
//         default:
//       }
//       return;
//     }
//
//     // handle failures.
//     if (result is ApiError) {
//       showToast(context, "API Error: ${result.message}");
//     } else if (result is AuthError) {
//       showToast(context, "Auth Error: ${result.message}");
//     } else if (result is ValidationError) {
//       showToast(context, "Validation Error: ${result.message}");
//     } else if (result is PaymentCanceledError) {
//       showToast(context, "Payment Canceled: ${result.message}");
//     } else if (result is UnprocessableTokenError) {
//       showToast(context, "Unprocessable Token Error: ${result.message}");
//     } else if (result is TimeoutError) {
//       showToast(context, "Timeout Error: ${result.message}");
//     } else if (result is NetworkError) {
//       showToast(context, "Network Error: ${result.message}");
//     } else if (result is UnspecifiedError) {
//       showToast(context, "Unspecified Error: ${result.message}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       body: Center(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: ListView(
//             children: [
//          //     const CoffeeImage(),
//               PaymentMethods(
//                 paymentConfig: paymentConfig,
//                 onPaymentResult: onPaymentResult,
//               ),
//               TextButton(
//                 onPressed: () async {
//                   final paymentSource = CreditCardSource(
//                     number: '4111111111111111', // رقم البطاقة
//                     expMonth: 12, // شهر انتهاء صلاحية البطاقة
//                     expYear: 25, // سنة انتهاء صلاحية البطاقة
//                     cvc: '123', // CVC
//                   );
//
//                   // أنشئ طلب الدفع
//                   final paymentRequest = PaymentRequest(paymentConfig, paymentSource);
//
//                   try {
//                     // تنفيذ الدفع
//                     final result = await Moyasar.pay(paymentRequest);
//                     onPaymentResult(result); // معالجة النتيجة
//                   } catch (e) {
//                     // التعامل مع الأخطاء العامة
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("حدث خطأ: $e")),
//                     );
//                   }
//                 },
//                 child: const Text(
//                   'تأكيد',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void showToast(BuildContext context, String status) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text(
//       "Status: $status",
//       style: const TextStyle(fontSize: 20),
//     ),
//   ));
// }