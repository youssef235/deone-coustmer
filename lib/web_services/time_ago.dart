import 'dart:developer';

import 'package:intl/intl.dart';

String timeAgo(String isoDateTime) {
  if (isoDateTime == "") {
    return "";
  }
  log(isoDateTime, name: 'createdT');
  DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm:ss", 'EN');
  DateTime date = formatter.parse(isoDateTime).toLocal();
  DateTime now = DateTime.now();
  Duration difference = now.difference(date);

  if (difference.inMinutes < 1) {
    return 'الآن';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} دقائق';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} ساعات';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} أيام';
  } else if (difference.inDays < 30) {
    int weeks = (difference.inDays / 7).floor();
    return '$weeks أسابيع';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return '$months أشهر';
  } else {
    int years = (difference.inDays / 365).floor();
    return '$years سنوات';
  }
}

void main() {
  print(timeAgo("2024-04-16T11:58:56.000000Z"));
}
