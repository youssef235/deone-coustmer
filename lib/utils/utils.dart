import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/app_keys.dart';

SnackBar buildSnackBar(
        {required String text, Color backgroundColor = Colors.red}) =>
    SnackBar(

      content: Text(text),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 10),
    );

String getTimeDifference(DateTime notificationDate) {
  final now = DateTime.now();
  final difference = now.difference(notificationDate);

  if (difference.inDays > 0) {
    return '${difference.inDays} أيام ';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ساعات';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} دقيقة';
  } else {
    return 'الآن';
  }
}

extension AppSnackbar on AppKeys {
  static show(snackBar) {
    AppKeys.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    AppKeys.scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}

extension ContextExtension on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension DisplayAmountExtension on double {
  // 0 -> 0
  // 10 -> 10
  // 123 -> 123
  // 1230 -> 1,230
  // 12300 -> 12,300
  // 123040 -> 123,040
  // 750200.2356 -> 750,200.23
  // 12k -> 12k
  // 12  -> 12
  toFixedAmount() {
    return toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
Future<bool> showDisclosureDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('الكشف عن الوصول إلى الموقع'),
        content: Text(
            'يحتاج هذا التطبيق إلى الوصول إلى موقعك لكي تتمكن من تحديد موقعك علي الخريطة. هل توافق على تقديم إذن الموقع؟'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // User agrees.
            },
            child: Text('موافق'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // User disagrees.
            },
            child: Text('غير موافق'),
          ),
        ],
      );
    },
  );
}
