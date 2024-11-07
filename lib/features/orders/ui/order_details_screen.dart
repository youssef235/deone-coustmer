import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/order_provider.dart';

class OrderDetails extends StatefulHookConsumerWidget {
  final Proposals proposal;
  const OrderDetails({Key? key, required this.proposal}) : super(key: key);

  @override
  ConsumerState<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetails> {
  bool isAccepted = false;
  @override
  void initState() {
    isAccepted = widget.proposal.status == "accepted";
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(orderNotifierProvider.notifier).getAddressFromCoordinates(
        widget.proposal.project?.location_lat ?? 0,
        widget.proposal.project?.location_lang ?? 0,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('رجوع'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            )),
        body: ref.watch(orderNotifierProvider).proposalLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 107, // Adjust the width as needed
                        height: 107, // Adjust the height as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.proposal.provider?.avatar ?? "",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Image.asset(
                              AppAssets.recLogo,
                              fit: BoxFit.fitWidth),
                          errorWidget: (context, url, error) => Image.asset(
                              AppAssets.recLogo,
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isAccepted
                                    ? 'جاري تنفيذ الطلب من الفني '
                                    : 'تم إرسال طلب من الفني ',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(
                                widget.proposal.provider?.name ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.ratesPreview,
                                    arguments: widget.proposal.provider);
                              },
                              child: const Text("عرض تقييمات الفني")),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'منذ ',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                              Text(
                                // Calculate the time difference from notification.date to now
                                getTimeDifference(DateTime.parse(
                                    widget.proposal.created_at ??
                                        DateTime.now().toString())),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 11),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .039),
                              const Text(
                                'الخدمة ',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                              Text(
                                widget.proposal.project?.name ?? "",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 11),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .039),
                              const Text(
                                'السعر ',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                              Text(
                                '${widget.proposal.price} ريال',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      isAccepted
                          ? Center(
                              child: InkWell(
                                onTap: () async {
                                  Map<String, dynamic>? rateResponse;
                                  if (widget.proposal.project!.reviewed == true)
                                    return;
                                  showDialog(
                                      context: context,
                                      barrierDismissible:
                                          true, // set to false if you want to force a rating
                                      builder: (context) => RatingDialog(
                                            submitButtonTextStyle:
                                                const TextStyle(
                                                    color:
                                                        AppColors.primaryColor),
                                            initialRating: 1.0,
                                            // your app's name?
                                            title: const Text(
                                              'نسعد بخدمتكم ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // encourage your user to leave a high rating?
                                            message: const Text(
                                              'تقييم الفني',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            // your app's logo?
                                            image: Container(
                                              width:
                                                  157, // Adjust the width as needed
                                              height:
                                                  157, // Adjust the height as needed
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: widget.proposal
                                                        .provider?.avatar ??
                                                    "",
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    Image.asset(
                                                        AppAssets.recLogo,
                                                        fit: BoxFit.fitWidth),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Image.asset(
                                                        AppAssets.recLogo,
                                                        fit: BoxFit.fitWidth),
                                              ),
                                            ),
                                            submitButtonText: 'ارسال',
                                            commentHint: 'التعليق',
                                            onCancelled: () =>
                                                print('cancelled'),
                                            onSubmitted: (response) async {
                                              rateResponse = {
                                                "rate": response.rating,
                                                "comment": response.comment
                                              };
                                              Navigator.pop(context);
                                              // return {"rate": response.rating , "comment": response.comment};
                                            },
                                          )).then((val) async {
                                    if (rateResponse == null) return;

                                    var result = await ref
                                        .read(orderNotifierProvider.notifier)
                                        .rateProvider(
                                            widget.proposal!.project?.id ?? 0,
                                            widget.proposal!.provider?.id ?? 0,
                                            rateResponse?["rate"].toInt() ?? 0,
                                            rateResponse?["comment"] ?? "");
                                    if (result != null) {
                                      rateResponse = null;
                                      Navigator.pop(context, true);
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue, // Background color
                                    borderRadius: BorderRadius.circular(
                                        10), // Adjust the radius as needed
                                    border: Border.all(
                                        color: Colors.grey,
                                        width: 1), // Gray border
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        getStateWidget(widget
                                                    .proposal.project?.status !=
                                                null
                                            ? widget.proposal.project?.status
                                            : ""),
                                        style: const TextStyle(
                                          color: Colors.white, // Text color
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      if (widget.proposal.project!.reviewed ==
                                              false &&
                                          widget.proposal.project?.status ==
                                              'completed')
                                        const Text("تقييم الفني",
                                            style:
                                                TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                const Spacer(),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: MediaQuery.of(context).size.height *
                                      0.068,
                                  decoration: BoxDecoration(
                                    color: AppColors.green6E,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      var result = await ref
                                          .read(orderNotifierProvider.notifier)
                                          .acceptProposal(
                                              widget.proposal.id ?? 0);
                                      if (result != null &&
                                          result.toString().isNotEmpty) {
                                        AppSnackbar.show(buildSnackBar(
                                            text: result.toString(),
                                            backgroundColor: Colors.green));
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            Routes.initRoute,
                                            (route) => false);
                                      }
                                    },
                                    child: const Text(
                                      'قبول',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .02),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: MediaQuery.of(context).size.height *
                                      0.068,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Colors.red, width: 2),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      var result = await ref
                                          .read(orderNotifierProvider.notifier)
                                          .refuseProposal(
                                              widget.proposal.id ?? 0);
                                      if (result != null &&
                                          result.toString().isNotEmpty) {
                                        AppSnackbar.show(buildSnackBar(
                                            text: result.toString(),
                                            backgroundColor: Colors.green));

                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            Routes.initRoute,
                                            (route) => false);
                                      }
                                    },
                                    child: const Text(
                                      'رفض',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                      // SizedBox(height: 16),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.90,
                      //   height: MediaQuery.of(context).size.height * 0.068,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.white,
                      //     borderRadius: BorderRadius.circular(5),
                      //     border: Border.all(color: Colors.grey, width: 2),
                      //   ),
                      //   child: TextButton(
                      //     onPressed: () async {},
                      //     child: const Text(
                      //       'اقترح سعر اخر',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         color: AppColors.grayDark,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "تفاصيل الطلب:",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColors.grayDark,
                                ),
                                const Text(
                                  "موقعي: ",
                                  style: TextStyle(color: AppColors.grayDark),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      ref.watch(orderNotifierProvider).add,
                                      style: const TextStyle(
                                          color: AppColors.grayWhite),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Divider(),
                            const SizedBox(height: 8),
                            const Row(
                              children: [
                                Icon(
                                  Icons.short_text_outlined,
                                  color: AppColors.grayDark,
                                ),
                                Text(
                                  "عرض الفني: ",
                                  style: TextStyle(color: AppColors.grayDark),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.proposal.description ?? "",
                              style:
                                  const TextStyle(color: AppColors.grayWhite),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}

getStateWidget(String? state) {
  String text = "";
  Color color = Colors.white;
  switch (state) {
    case 'progress':
      text = "جاري التنفيذ";
      color = AppColors.blue;
      break;
    case 'closed':
      text = "مغلق";
      color = Colors.black54;
      break;
    case 'cancelled':
      text = "ملغي";
      color = AppColors.red;
      break;
    case 'completed':
      text = "ئمكتمل";
      color = AppColors.green6E;
      break;
    default:
      text = text = "جاري التنفيذ";
      // Handle the case when the state is not one of the expected values
      return text; // Return an empty container or handle it differently
  }
  return text;
}
