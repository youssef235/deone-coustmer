import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasq/features/orders/data/providers/order_provider.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wasq/features/orders/data/model/order_response.dart' as notif;

import '../../../web_services/time_ago.dart';

class NotificationsScreen extends StatefulHookConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(orderNotifierProvider.notifier).getUserNotificationsData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'التنبيهات',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ref.watch(orderNotifierProvider).loading
            ? ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.grey[100],
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              )
            : ref.watch(orderNotifierProvider).notifications.isEmpty
                ? const Center(
                    child: Text('لا يوجد تنبيهات'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: ListView.separated(
                      itemCount:
                          ref.read(orderNotifierProvider).notifications.length,
                      itemBuilder: (context, index) => NotifcationWidget(
                        context,
                        ref.read(orderNotifierProvider).notifications[index],
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ));
  }
}

class NotificationItem extends ConsumerWidget {
  final notif.Notification notification;

  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
        border: Border.all(color: Colors.grey, width: 1), // Add a gray border
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, // Shadow color
            blurRadius: 5, // Adjust the blur radius as needed
            offset: Offset(0, 2), // Adjust the offset as needed
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${notification.title}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 10,
          ),
          Text(
            "${notification.body}",
            style: const TextStyle(color: Colors.black87, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// Section Widget
Widget NotifcationWidget(
    BuildContext context, notif.Notification notifcationData) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xfff6f6f6),
              borderRadius: BorderRadius.circular(15.r)),
          // height: 120.h,
          width: 428.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notifcationData.title ?? "ddknk",
                    ),
                    Text(
                      notifcationData.body ?? "",
                      textAlign: TextAlign.right,

                      // style: CustomTextStyles.bodyMediumCairoWhiteA70001,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('res/assets/clock.svg'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            timeAgo(notifcationData.created_at ?? "") !=
                                    ' الان '
                                ? "" "قبل" +
                                    timeAgo(notifcationData.created_at ?? "")
                                : timeAgo(notifcationData.created_at ?? ""),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(color: Color(0xffC9C6C6))),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 8.h,
                  width: 8.h,
                  margin: EdgeInsets.only(
                    left: 9.h,
                    top: 17.h,
                    bottom: 21.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
