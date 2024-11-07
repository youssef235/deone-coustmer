import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wasq/features/service_form/ui/widgets/widgets.dart';

import '../../../app/routes.dart';
import '../../../app/widgets/gallery.dart';
import '../../../app/widgets/viedo_widget.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/el_icons.dart';
import '../../../utils/constants.dart';
import '../../../utils/hive_manager.dart';
import '../../../utils/utils.dart';
import '../../invoice/data/provider/invoice_provider.dart';
import '../../invoice/ui/invoice_screen.dart';
import '../data/providers/order_provider.dart';
import 'map_screen.dart';

class RequestService extends StatefulHookConsumerWidget {
  final Proposals proposal;
  final Order? order;
  const RequestService({
    Key? key,
    required this.proposal,
    this.order,
  }) : super(key: key);

  @override
  ConsumerState<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends ConsumerState<RequestService> {
  bool isAccepted = false;
  bool isLoading = false;
  bool isStatusLoading = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController text_controller = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();
  Position? _currentPosition;

  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  late VideoPlayerController _controller;
  List<GalleryItem> galaryImages = [];

  late Timer _timer;
  String? projectStatus;

  getProjectStatus(int projectID) async {
    try {
      final response = await Dio()
          .get("https://t8nat.cloud/api/single-project-status/$projectID",
              options: Options(headers: {
                "Authorization":
                    "Bearer ${HiveManager.getData(StorageKeys.tokenKey)}",
                "Accept": "application/json"
              }));
      isStatusLoading = false;
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        setState(() {
          projectStatus = data['status'];
        });
        return data['status'];
      } else {
        print("Error: ${response.statusCode} - ${response.data}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  @override
  initState() {
    getProjectStatus(widget.proposal.project!.id!);

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      setState(() {
        _currentPosition = value;
      });
    });

    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      getProjectStatus(widget.proposal.project!.id!);
    });
    isAccepted = widget.proposal.status == "accepted";
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(orderNotifierProvider.notifier).getAddressFromCoordinates(
            widget.order?.location_lat ?? 0,
            widget.order?.location_lang ?? 0,
          );
    });
    Future.delayed(const Duration(seconds: 0), () {
      if (widget.proposal.project!.attachment_images!.isNotEmpty) {
        galaryImages = widget.proposal.project!.attachment_images!
            .map((e) => GalleryItem(id: e.id.toString(), resource: e.url ?? ""))
            .toList();
      }
    });

    if (widget.proposal.project!.attachments_videos != null &&
        widget.proposal.project!.attachments_videos!.isNotEmpty &&
        widget.proposal.project!.attachments_videos?[0].url != null &&
        widget.proposal.project!.attachments_videos?[0].url != "") {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.proposal.project!.attachments_videos![0].url!),
      )..initialize().then((_) {
          _controller.setLooping(true);
          setState(() {});
        });
    }
    _audioPlayer = AudioPlayer();
    super.initState();
  }

  void openGoogleMapsApp(double destinationLat, double destinationLong) async {
    // final String googleMapsUrl = "geo:$destinationLat,$destinationLong";

    String mapsUrl =
        "https://www.google.com/maps/dir/?api=1&origin=$destinationLat,$destinationLong&travelmode=driving";
    // if (await canLaunch(googleMapsUrl)) {
    //   await launch(googleMapsUrl);
    // } else {
    //   throw 'Could not launch $googleMapsUrl';
    // }
    if (Platform.isIOS) {
      mapsUrl = "maps://?saddr=$destinationLat,$destinationLong";
    }
    if (await canLaunchUrl(Uri.parse(mapsUrl))) {
      await launchUrl(Uri.parse(mapsUrl));
    } else {
      throw 'Could not launch Google Maps';
    }
  }

  @override
  void dispose() {
    if (widget.proposal.project!.attachments_videos != null &&
        widget.proposal.project!.attachments_videos!.isNotEmpty &&
        widget.proposal.project!.attachments_videos?[0].url != null &&
        widget.proposal.project!.attachments_videos?[0].url != "") {
      _controller.dispose();
    }
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playRecording() async {
    if (widget.proposal.attachments![0].url != null &&
        widget.proposal.attachments![0].url != "") {
      setState(() {
        isPlaying = true;
      });
      print("${widget.proposal.attachments![0].url}");

      await _audioPlayer.setUrl(widget.proposal.attachments![0].url.toString());
      await _audioPlayer.play();
      print("ssss");
    } else {
      print('No recorded audio to play');
    }
  }

  Future<void> _pauseRecording() async {
    if (widget.proposal.attachments![0].url != null &&
        widget.proposal.attachments![0].url != "") {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      print('No recorded audio to pause');
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(orderNotifierProvider.select((value) => value.errorMessage),
        (previous, nextErrorMessage) {
      if (nextErrorMessage != null && nextErrorMessage != '') {
        AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
        Future.delayed(const Duration(seconds: 3), () {
          ref.read(orderNotifierProvider.notifier).resetErrorMessage();
        });
      }
    });
    return Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: AppBar(
          backgroundColor: const Color(0xffE5E5E5),
          title: const Text('رجوع'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ref.watch(orderNotifierProvider).proposalLoading ||
                isStatusLoading && isAccepted
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 290.h, // Adjust the width as needed
                        width: 367.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                0,
                                2,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${widget.order?.id.toString() ?? ""} #',
                                  style: const TextStyle(
                                      color: Color(0xffFE724C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, right: 8, left: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.proposal.provider?.name ?? "",
                                          style: const TextStyle(
                                              color: Color(0xff9796A1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          widget.order?.name ?? "".toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.12),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: const Offset(
                                            0,
                                            2,
                                          ),
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 60, // Adjust the width as needed
                                        height:
                                            60, // Adjust the height as needed
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: widget
                                                  .proposal.provider?.avatar ??
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
                                              Image.asset(AppAssets.recLogo,
                                                  fit: BoxFit.fitWidth),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(AppAssets.recLogo,
                                                  fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'الان',
                                        style:
                                            TextStyle(color: Color(0xff9796A1)),
                                      ),
                                      Text(
                                        'في الطريق اليك',
                                        style:
                                            TextStyle(color: Color(0xff111719)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'يبعد عنك',
                                        style:
                                            TextStyle(color: Color(0xff9796A1)),
                                      ),
                                      _currentPosition != null &&
                                              widget.order?.provider
                                                      ?.location_lang !=
                                                  null
                                          ? Text(
                                              '${(Geolocator.distanceBetween(
                                                    _currentPosition!.latitude,
                                                    _currentPosition!.longitude,
                                                    double.tryParse(widget
                                                                .order
                                                                ?.provider
                                                                ?.location_lang ??
                                                            "0") ??
                                                        0,
                                                    double.tryParse(widget
                                                                .order
                                                                ?.provider
                                                                ?.location_lang ??
                                                            "0") ??
                                                        0,
                                                  ) / 1000).toStringAsFixed(2)} كم',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff111719)),
                                            )
                                          : const SizedBox(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (projectStatus != "cancelled")
                                ActionButton(
                                  text: 'تتبع طلبي',
                                  onTap: () async {
                                    var per = await getPer(context);
                                    if (per == true) {
                                      Navigator.pushNamed(context, Routes.trackingScreen, arguments: widget.proposal);
                                    }
                                  },
                                ),
                              // if (projectStatus != "completed" &&
                              //     projectStatus != "cancelled" &&
                              //     projectStatus != "under_review")
                              //   ActionButton(
                              //     color: Colors.white,
                              //     text: 'الغاء الطلب',
                              //     textColor: Color(0xff111719),
                              //     onTap: () {
                              //       Navigator.pushNamed(context, Routes.invoice, arguments: widget.proposal);
                              //
                              //       //   _showTextInputDialog(context);
                              //     },
                              //   ),
                              SizedBox(width: 20.w),
                              if (projectStatus != "cancelled")
                                ActionButton(
                                  onTap: () {
                                    launch('tel:${widget.proposal.provider?.phone}');
                                  },
                                  text: 'الاتصال بالفني ',
                                ),
                              SizedBox(width: 20.w),
                           //   if (projectStatus == "progress" || projectStatus == "completed")
                                ActionButton(
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.invoice, arguments: widget.proposal);
                                  },
                                  text: 'الدفع الان',
                                ),
                            ],
                          ),
                        ),

                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (projectStatus != "completed" &&
                          projectStatus != "cancelled" &&
                          projectStatus != "under_review" &&
                          widget.order?.location_lang != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r)),
                                height: 200,
                                width: 422,
                                child: MapScreenWidget(
                                  order: widget.order,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  log(
                                      widget.order?.location_lat.toString() ??
                                          "",
                                      name: 'lat2');
                                  openGoogleMapsApp(
                                    double.tryParse(widget.order?.provider
                                                ?.location_lat ??
                                            "0") ??
                                        0,
                                    double.tryParse(widget.order?.provider
                                                ?.location_lang ??
                                            "0") ??
                                        0,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffED6522),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20.r),
                                          bottomLeft: Radius.circular(20.r))),
                                  height: 44.h,
                                  width: 422,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('res/assets/direction.png'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'اتجاه الخريطة',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const SizedBox(
                              height: 20,
                            ),
                            !isAccepted
                                ? !isLoading
                                    ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  isLoading = true;
                                                  var result = await ref
                                                      .read(
                                                          orderNotifierProvider
                                                              .notifier)
                                                      .acceptProposal(
                                                          widget.proposal.id ??
                                                              0);
                                                  isLoading = false;
                                                  if (result != null &&
                                                      result
                                                          .toString()
                                                          .isNotEmpty) {
                                                    Navigator.pushNamedAndRemoveUntil(
                                                        context,
                                                        Routes
                                                            .requestServiceScreen,
                                                        (route) =>
                                                            route.isFirst,
                                                        arguments: widget
                                                            .proposal
                                                            .copyWith(
                                                                status:
                                                                    "accepted"));
                                                    AppSnackbar.show(
                                                        buildSnackBar(
                                                            text: result
                                                                .toString(),
                                                            backgroundColor:
                                                                Colors.green));
                                                  }
                                                },
                                                child: Container(
                                                  width: 100.w,
                                                  height: 50.h,
                                                  decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          spreadRadius: 0.1,
                                                          color: Colors.grey),
                                                    ],
                                                    color: Colors.green,
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Center(
                                                      child: Text(
                                                    'قبول',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),



                                              const SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  var result = await ref
                                                      .read(
                                                          orderNotifierProvider
                                                              .notifier)
                                                      .refuseProposal(
                                                          widget.proposal.id ??
                                                              0);
                                                  if (result != null &&
                                                      result
                                                          .toString()
                                                          .isNotEmpty) {
                                                    AppSnackbar.show(
                                                        buildSnackBar(
                                                            text: result
                                                                .toString(),
                                                            backgroundColor:
                                                                Colors.green));

                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Container(
                                                  width: 100.w,
                                                  height: 50.h,
                                                  decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          spreadRadius: 0.1,
                                                          color: Colors.grey),
                                                    ],
                                                    color: Colors.red,
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Center(
                                                      child: Text(
                                                    'رفض',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),


                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator())
                                : const SizedBox(),
                            const SizedBox(
                              height: 10,
                            ),

                          ]),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'تفاصيل الأسعار',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Container(
                          height: 230.h,
                          width: 475.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text(
                                        "المبلغ",
                                        style:
                                            TextStyle(color: Color(0xff898989)),
                                      ),
                                    ),
                                    const Spacer(),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${(widget.proposal.price!.toDouble()).toStringAsFixed(2)}  ',
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black)),
                                          const TextSpan(
                                              text: 'ر.س',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xffFF8D47))),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text(
                                        "تكلفة المعدات",
                                        style:
                                            TextStyle(color: Color(0xff898989)),
                                      ),
                                    ),
                                    const Spacer(),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${(widget.proposal.project!.equipment_cost.toDouble()).toStringAsFixed(2)} ',
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black)),
                                          const TextSpan(
                                              text: 'ر.س',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xffFF8D47))),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text(
                                        "اجمالي المبلغ",
                                        style:
                                            TextStyle(color: Color(0xff898989)),
                                      ),
                                    ),
                                    const Spacer(),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${(widget.proposal.price!.toDouble() + widget.proposal.project!.equipment_cost.toDouble()).toStringAsFixed(2)}  ',
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black)),
                                          const TextSpan(
                                              text: 'ر.س',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Color(0xffFF8D47))),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text("حالة الطلب",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primaryColor)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      whiteButtonTile(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: projectStatus == "completed"
                            ? AppColors.green6E
                            : projectStatus == "under_review" ||
                                    projectStatus == "cancelled"
                                ? AppColors.red
                                : AppColors.primaryColor,
                        icon: projectStatus == "completed"
                            ? Icons.done_all
                            : projectStatus == "cancelled"
                                ? null
                                : projectStatus == "under_review"
                                    ? null
                                    : El.autorenew,
                        textColor: AppColors.white,
                        iconLeft: true,
                        title: getStateWidget(projectStatus),
                        context: context,
                        pressed: null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ));
  }

  Future<String?> _showTextInputDialog(
    BuildContext context,
  ) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            child: AlertDialog(
              backgroundColor: AppColors.primaryColor,
              title: const Text('سبب الالغاء',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              content: Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: AppColors.grayWhite), // Add a border
                  ),
                  height: 100.0, // Fixed height
                  child: SingleChildScrollView(
                    // Add a SingleChildScrollView for scrolling
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _textFieldController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخل سبب الالغاء';
                          }
                          return null;
                        },
                        maxLines: null, // Allow multiple lines for notes
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'اكتب سبب الالغاء',
                          border: InputBorder
                              .none, // Remove the default input border
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.black),
                    ),
                    child: const Text(
                      'الغاء',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var result = await ref
                            .read(orderNotifierProvider.notifier)
                            .cancelProject(widget.proposal.project?.id ?? 0,
                                _textFieldController.text);
                        if (result != null && result.toString().isNotEmpty) {
                          AppSnackbar.show(buildSnackBar(
                              text: "تم الغاء طلب الخدمه بنجاح",
                              backgroundColor: Colors.green));
                          _textFieldController.clear();
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.initRoute, (route) => false);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  getStateWidget(String? state) {
    String text = "";
    Color color = Colors.white;
    switch (state) {
      case 'progress':
        text = "جاري التنفيذ";
        color = AppColors.blue;
        break;
      case 'under_review':
        text = widget.proposal.project!.equipment_cost == 0
            ? "اجمالي المبلغ ${(widget.proposal.price!.toDouble() + widget.proposal.project!.equipment_cost.toDouble()).toStringAsFixed(2)} ريال"
            : "اجمالي المبلغ مع المشتريات ${(widget.proposal.price!.toDouble() + widget.proposal.project!.equipment_cost.toDouble()).toStringAsFixed(2)} ريال";
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
        text = "مكتمل";
        color = AppColors.green6E;
        break;
      default:
        text = text = "جاري التنفيذ";
        // Handle the case when the state is not one of the expected values
        return text; // Return an empty container or handle it differently
    }
    return text;
  }
}

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final String text;

  const ActionButton({
    super.key,
    required this.onTap,
    this.color,
    this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 135.w,
        height: 43.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (color ?? const Color(0xffFE724C)).withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(
                0,
                2,
              ),
            ),
          ],
          color: color ?? const Color(0xffFE724C),
          border: Border.all(color: Colors.grey, width: 0.1),
          borderRadius: BorderRadius.circular(28.5.r),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.white),
        )),
      ),
    );
  }
}

Future<bool> getPer(context) async {
  bool services;
  LocationPermission per;
  services = await Geolocator.isLocationServiceEnabled();

  if (services != true) {
    // AwesomeDialog(
    //         headerAnimationLoop: true,
    //         context: context,
    //         title: "Gps",
    //         desc: "من فضلك قم بتشغل الGPS",
    //         btnCancelOnPress: () {},
    //         dialogType: DialogType.warning,
    //         animType: AnimType.scale)
    //     .show();
    return false;
  }

  per = await Geolocator.checkPermission();
  if (per == LocationPermission.denied) {
    per = await Geolocator.requestPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      AppSnackbar.show(buildSnackBar(
          text: "لتجربة أفضل من فضلك اعطي التطبيق صلاحيات الموقع"));
      return false;
    } else {
      return true;
    }
  } else {
    return true;
  }
}
