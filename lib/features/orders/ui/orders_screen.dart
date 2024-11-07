import 'package:cached_network_image/cached_network_image.dart';
import 'package:wasq/app/routes.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:wasq/features/orders/ui/widgets.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../theme/app_assets.dart';
import '../../../utils/utils.dart';
import '../data/providers/order_provider.dart';

enum Segment {
  active,
  old,
}

extension SegmentsExtension on Segment {
  String get label {
    switch (this) {
      case Segment.active:
        return 'النشطة';
      case Segment.old:
        return 'السابقة';
      default:
        return 'اخرى';
    }
  }

  bool get isActive => this == Segment.active;

  bool get isOld => this == Segment.old;
}

class OrdersScreen extends StatefulHookConsumerWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(orderNotifierProvider.notifier).getOrderData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grayBackground2,
        // appBar: AppBar(
        //   backgroundColor: AppColors.primaryColor,
        //   title: const Text(
        //     'الطلبات',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   centerTitle: true,
        // ),

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
            : ref.read(orderNotifierProvider).orderResponse.projects!.isEmpty
                ? const Center(
                    child: Text('لا يوجد طلبات'),
                  )
                : SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: OrderItemsList(
                          activeProjects: ref
                              .read(orderNotifierProvider)
                              .orderResponse
                              .projects!,
                          notActiveProjects: ref
                              .read(orderNotifierProvider)
                              .notActiveOrderResponse
                              .projects!,
                          ref: ref,
                        )

                        // ListView.separated(
                        //   itemCount: ref.read(orderNotifierProvider).orderResponse.proposals?.length??0,
                        //   itemBuilder: (context, index) =>NotificationItem( proposal: ref.read(orderNotifierProvider).orderResponse.proposals![index],),
                        //   separatorBuilder: (BuildContext context, int index)=> const Divider(),
                        // ),
                        ),
                  ));
  }
}
//
// class NotificationItem extends ConsumerWidget {
//   final Proposals proposal;
//
//   const NotificationItem({Key? key, required this.proposal}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     Color textColor =
//         proposal.status == "accepted" ? Colors.white : Colors.grey;
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, Routes.requestServiceScreen,
//                 arguments: proposal)
//             .then(
//           (refresh) {
//             if (refresh == true) {
//               ref.read(orderNotifierProvider.notifier).getOrderData();
//             }
//           },
//         );
//       },
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16.0),
//         margin: const EdgeInsets.symmetric(horizontal: 3.0),
//         decoration: BoxDecoration(
//           color:
//               proposal.status == "accepted" ? Colors.green[500] : Colors.white,
//           borderRadius:
//               BorderRadius.circular(10), // Adjust the radius as needed
//           border: Border.all(color: Colors.grey, width: 1), // Add a gray border
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.grey, // Shadow color
//               blurRadius: 5, // Adjust the blur radius as needed
//               offset: Offset(0, 2), // Adjust the offset as needed
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             // Display the circular image here
//             Container(
//               width: 49, // Adjust the width as needed
//               height: 49, // Adjust the height as needed
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.black, width: 1),
//               ),
//               child: CachedNetworkImage(
//                 imageUrl: proposal.provider?.avatar ?? "",
//                 imageBuilder: (context, imageProvider) => Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 placeholder: (context, url) =>
//                     Image.asset(AppAssets.recLogo, fit: BoxFit.fitWidth),
//                 errorWidget: (context, url, error) =>
//                     Image.asset(AppAssets.recLogo, fit: BoxFit.fitWidth),
//               ),
//             ),
//             const SizedBox(width: 16),
//
//             // Display the notification text
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       proposal.status == "accepted"
//                           ? 'جاري تنفيذ الطلب من الفني'
//                           : 'تم إرسال طلب من الفني ',
//                       style: TextStyle(color: textColor),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width * .29,
//                       child: Text(
//                         proposal.provider?.name ?? "",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.black),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Text(
//                       'منذ ',
//                       style: TextStyle(color: textColor, fontSize: 11),
//                     ),
//                     Text(
//                       // Calculate the time difference from notification.date to now
//                       getTimeDifference(DateTime.parse(proposal.created_at ??
//                           "2023-10-21T09:18:23.000000Z")),
//                       style: TextStyle(color: textColor, fontSize: 11),
//                     ),
//                     SizedBox(width: MediaQuery.of(context).size.width * .039),
//                     Text(
//                       'الخدمة ',
//                       style: TextStyle(color: textColor, fontSize: 11),
//                     ),
//                     Text(
//                       proposal.project?.name ?? "",
//                       style: TextStyle(color: textColor, fontSize: 11),
//                     ),
//                     SizedBox(width: MediaQuery.of(context).size.width * .039),
//                     Text(
//                       'السعر ',
//                       style: TextStyle(color: textColor, fontSize: 11),
//                     ),
//                     Text(
//                       '${(proposal.price!.toDouble() + proposal.project!.equipment_cost.toDouble()).toStringAsFixed(2)} ريال',
//                       style: TextStyle(color: textColor, fontSize: 11),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
