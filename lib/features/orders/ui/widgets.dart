import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasq/app/routes.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:wasq/features/orders/data/providers/order_provider.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'request_screen.dart';

Widget OrderCard(Order projects, context, ref) {
  var date = DateTime.now();
  try {
    date = projects.available_time != null
        ? DateTime.parse(projects.available_time!)
        : DateTime.now();
  } catch (e) {
    print(e);
  }
  var dateFormat = DateFormat('dd/MMM/yy', 'EN').format(date);
  var time = "${date.hour}:${date.minute}";
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: InkWell(
      onTap: () async {
        if (projects.provider != null) {
          Proposals? proposal = Proposals(
            project: Project(
              id: projects.id,
              attachment_audios: projects.attachment_audios,
              attachment_images: projects.attachment_images,
              attachments_videos: projects.attachments_videos,
              available_time: projects.available_time,
              description: projects.description,
              status: projects.status,
              equipment_cost: projects.equipment_cost,
              reviewed: projects.reviewed,
            ),
            price: projects.proposals?[0].price,
            id: projects.proposals?[0].id,
            original_price: projects.proposals?[0].original_price,
            provider: projects.provider,
            status: projects.proposals?[0].status,
            description: projects.proposals?[0].description,
            attachment_audios: projects.proposals?[0].attachment_audios,
            attachments: projects.proposals?[0].attachments,
          );

          await Navigator.push(context, MaterialPageRoute(builder: (c) {
            return RequestService(
              proposal: proposal,
              order: projects,
            );
          })).then((value) =>
              ref.read(orderNotifierProvider.notifier).getOrderData());
          // Navigator.pushNamed(context, Routes.requestServiceScreen,
          //         arguments: proposal)
          //     .then(
          //   (refresh) {
          //     ref.read(orderNotifierProvider.notifier).getOrderData();
          //   },
          // );
        } else {
          await Navigator.pushNamed(context, Routes.chooseProposalScreen,
              arguments: projects.id);

          ref.read(orderNotifierProvider.notifier).getOrderData();
        }
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffF8F8F8),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 209, 209, 209), blurRadius: 5)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('res/assets/settingImage.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            "${projects.name}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xff595959),
                              fontFamily: 'madani',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('res/assets/timer.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xff595959),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('res/assets/calendar.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        dateFormat.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xff595959),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(
                //   Icons.timelapse,
                //   color: Colors.white,
                // ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('res/assets/condition.svg'),
                    Text("${projects.id.toString()}#",
                        style: const TextStyle(
                          color: Color(0xffFF8D47),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text((() {
                  switch (projects.status) {
                    case "wait":
                      return "قيد الانتظار";
                    case "under_review":
                      return "في انتظار الدفع";
                    case "progress":
                      return "قيد التنفيذ";
                    case "cancelled":
                      return "ملغي";
                    case "accepted":
                      return "تم قبوله";
                    case "completed":
                      return "تم الانتهاء";
                    case "closed":
                      return "مغلق";
                    case "opened":
                      return "في انتظار اختيار فني";
                    default:
                      return "قيد الانتظار";
                  }
                })()
                    // projects.status.toString()
                    ,
                    style: const TextStyle(
                      color: Color(0xffFF8D47),
                      fontSize: 13,
                    ))
              ],
            )
          ],
        ),
      ),
    ),
  );
}

class OrderItemsList extends StatefulWidget {
  final List<Order> activeProjects;
  final List<Order> notActiveProjects;
  final WidgetRef ref;
  const OrderItemsList(
      {required this.ref,
      Key? key,
      required this.activeProjects,
      required this.notActiveProjects})
      : super(key: key);

  @override
  State<OrderItemsList> createState() => _OrderItemsListState();
}

class _OrderItemsListState extends State<OrderItemsList> {
  var _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الطلبات',
                style: TextStyle(color: Color(0xff707070), fontSize: 19),
              )),
        ),
        DefaultTabController(
          length: 2,
          child: TabBar(
              // tabAlignment: TabAlignment.start,
              // isScrollable: true,
              labelColor: AppColors.primaryColor,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 3),
              onTap: (val) {
                setState(() {
                  _selectedTab = val;
                });
              },
              tabs: [
                Container(
                  width: 192.w,
                  height: 52.h,
                  decoration: _selectedTab == 0
                      ? underLineDecoration()
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(9.r),
                          border: Border.all(
                              width: 2, color: AppColors.borderColor),
                        ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('الطلبات الجديدة',
                          maxLines: 1,
                          style: _selectedTab == 0
                              ? selectedSegmentTextStyle()
                              : unSelectedSegmentTextStyle())),
                ),
                Container(
                  width: 192.w,
                  height: 52.h,
                  decoration: _selectedTab == 1
                      ? underLineDecoration()
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(9.r),
                          border: Border.all(
                              width: 2, color: AppColors.borderColor),
                        ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('الطلبات المنتهية',
                          maxLines: 1,
                          style: _selectedTab == 1
                              ? selectedSegmentTextStyle()
                              : unSelectedSegmentTextStyle())),
                ),
              ]),
        ),
        // const SizedBox(height: 20,) ,
        // SegmentedButton(
        //   showSelectedIcon: false,
        //   style: ButtonStyle(
        //       side: MaterialStateProperty.all(const BorderSide(
        //           color: Color.fromARGB(0, 12, 8, 8),
        //           width: 1.0,
        //           style: BorderStyle.solid)),
        //       backgroundColor:
        //           MaterialStateColor.resolveWith((Set<MaterialState> states) {
        //         return const Color.fromARGB(0, 0, 150, 135);
        //       })),
        //   segments: [
        //     ButtonSegment<int>(
        //       value: 0,
        //       label: Padding(
        //         padding: EdgeInsets.all(5),
        //         child: Container(
        //           width: 192.w,
        //           height: 60.h,
        //           decoration: _selectedTab == 0
        //               ? underLineDecoration()
        //               : BoxDecoration(
        //                   borderRadius: BorderRadius.circular(9.r),
        //                   border: Border.all(
        //                       width: 2, color: AppColors.borderColor),
        //                 ),
        //           child: Align(
        //               alignment: Alignment.center,
        //               child: Text('الطلبات الجديدة',
        //                   maxLines: 1,
        //                   style: _selectedTab == 0
        //                       ? selectedSegmentTextStyle()
        //                       : unSelectedSegmentTextStyle())),
        //         ),
        //       ),
        //     ),
        //     ButtonSegment<int>(
        //       value: 1,
        //       label: Container(
        //         width: 192.w,
        //         height: 60.h,
        //         decoration: _selectedTab == 1
        //             ? underLineDecoration()
        //             : BoxDecoration(
        //                 borderRadius: BorderRadius.circular(9.r),
        //                 border:
        //                     Border.all(width: 2, color: AppColors.borderColor),
        //               ),
        //         child: Align(
        //             alignment: Alignment.center,
        //             child: Text('الطلبات المنتهية',
        //                 maxLines: 1,
        //                 style: _selectedTab == 1
        //                     ? selectedSegmentTextStyle()
        //                     : unSelectedSegmentTextStyle())),
        //       ),
        //     ),
        //   ],
        //   selected: <int>{_selectedTab},
        //   onSelectionChanged: (Set<int> sel) {
        //     setState(() {
        //       _selectedTab = sel.last;
        //     });
        //   },
        // ),
        const SizedBox(
          height: 20,
        ),
        _selectedTab == 0
            ? widget.activeProjects.isNotEmpty
                ? Expanded(
                    child: ListView.separated(
                      itemCount: widget.activeProjects.length ?? 0,
                      itemBuilder: (context, index) => OrderCard(
                          widget.activeProjects[index], context, widget.ref),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 5,
                      ),
                    ),
                  )
                : const Center(
                    child: Text("لا يوجد طلبات"),
                  )
            : widget.notActiveProjects.isNotEmpty
                ? Expanded(
                    child: ListView.separated(
                      itemCount: widget.notActiveProjects.length ?? 0,
                      itemBuilder: (context, index) => OrderCard(
                          widget.notActiveProjects[index], context, widget.ref),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 5,
                      ),
                    ),
                  )
                : const Center(
                    child: Text("لا يوجد طلبات"),
                  )
      ]),
    );
  }
}

BoxDecoration underLineDecoration() {
  return BoxDecoration(
    color: AppColors.primaryColor,
    border: Border.all(width: 1, color: AppColors.borderColor),
    borderRadius: BorderRadius.circular(9.r),
  );
}

TextStyle selectedSegmentTextStyle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.white,
    fontFamily: 'madani',
  );
}

TextStyle unSelectedSegmentTextStyle() {
  return const TextStyle(
    fontFamily: 'madani',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xffC7C4C4),
  );
}
