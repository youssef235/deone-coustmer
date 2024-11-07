import 'dart:async';

// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasq/features/auth/data/providers/auth_provider.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../utils/utils.dart';
import '../../orders/data/model/order_response.dart';
import '../data/providers/chat_provider.dart';

class Chat extends StatefulHookConsumerWidget {
  final Proposals proposal;
  const Chat({
    required this.proposal,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Chat> createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> {
  TextEditingController text_controller = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Position currentLocation;
  double lat = 360, lange = 360;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(widget.proposal.provider?.name ?? ""),
              if (widget.proposal.provider!.avg_rate == null)
                const Text("تقييم : 0"),
              if (widget.proposal.provider!.avg_rate != null)
                Text("تقييم :${widget.proposal.provider!.avg_rate}"),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.trackingScreen,
                    arguments: widget.proposal);
              },
              icon: const Icon(Icons.map),
            ),
            IconButton(
              onPressed: () {
                launch('tel:${widget.proposal.provider?.phone}');
              },
              icon: const Icon(Icons.call),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: buildMessageList(),
            ),
            buildMessageInput(),
          ],
        ), //
      ),
    );
  }

  buildMessageList() {
    return StreamBuilder(
        stream: ref.watch(chatNotifierProvider.notifier).getMessages(
              ref.read(authNotifierProvider).user!.id ?? 0,
              widget.proposal.provider?.id ?? 0,
              widget.proposal.id ?? 0,
            ),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('حدث خطأ ما'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('لا يوجد رسائل'),
            );
          } else {
            return ListView.builder(
              reverse: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return buildMessageItem(snapshot.data!.docs[index]);
              },
            );
          }
        });
  }

  Widget buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment =
        data['sender'] == "user" ? Alignment.centerRight : Alignment.centerLeft;
    return data['type'] == "text"
        ? Container(
            alignment: alignment,
            child: Column(
              crossAxisAlignment: data['sender'] == "user"
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(data['sender'] == "user"
                      ? 'أنت'
                      : widget.proposal.provider?.name ?? ""),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: data['sender'] == "user"
                        ? AppColors.primaryColor
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    data['message'],
                    style: TextStyle(
                      color: data['sender'] == "user"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                )
              ],
            ), // Column
          )
        : data['type'] == "invoice"
            ? Container(
                alignment: alignment,
                child: Column(
                  crossAxisAlignment: data['sender'] == "user"
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(data['sender'] == "user"
                          ? 'أنت'
                          : widget.proposal.provider?.name ?? ""),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      decoration: BoxDecoration(
                        color: data['sender'] == "user"
                            ? AppColors.primaryColor
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            data['message'],
                            style: TextStyle(
                              color: data['sender'] == "user"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height *
                                0.058,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                var result = await Navigator.pushNamed(
                                    context, Routes.invoice,
                                    arguments: widget.proposal);
                              },
                              child: const Text(
                                "ادفع",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ), // Column
              )
            : data['type'] == "location"
                ? Container(
                    alignment: alignment,
                    child: Column(
                      crossAxisAlignment: data['sender'] == "user"
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(data['sender'] == "user"
                              ? 'أنت'
                              : widget.proposal.provider?.name ?? ""),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: data['sender'] == "user"
                                ? AppColors.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GoogleMap(
                            scrollGesturesEnabled: false,
                            onTap: (latLng) {
                              launch(
                                  'https://maps.google.com/?q=${data['message']}');
                            },
                            markers: {
                              Marker(
                                markerId: MarkerId("1"),
                                position: LatLng(
                                    double.parse(data['message'].split(",")[0]),
                                    double.parse(
                                        data['message'].split(",")[1])),
                              )
                            },
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  double.parse(data['message'].split(",")[0]),
                                  double.parse(data['message'].split(",")[1])),
                              zoom: 15,
                            ),
                          ),
                        ),
                      ],
                    ), // Column
                  )
                : Container(
                    alignment: alignment,
                    child: Column(
                      crossAxisAlignment: data['sender'] == "user"
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(data['sender'] == "user"
                              ? 'أنت'
                              : widget.proposal.provider?.name ?? ""),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: data['sender'] == "user"
                                ? AppColors.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: data['message'] ?? "",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: imageProvider,
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
                      ],
                    ), // Column
                  );
  }

  Future<void> getPos() async {
    currentLocation =
        await Geolocator.getCurrentPosition().then((value) => value);

    lat = currentLocation.latitude;
    lange = currentLocation.longitude;

    print("lat : $lat");
    print("lang : $lange");
  }

  Future<bool> getPer() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();


    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      bool userAgreed = await showDisclosureDialog(context);

      if (userAgreed) {
        // User agreed to the disclosure, proceed to request location permission
        per = await Geolocator.requestPermission();
      } else {
        // User disagreed to the disclosure, handle accordingly
        AppSnackbar.show(buildSnackBar(
            text: "لتجربة أفضل من فضلك اعطي التطبيق صلاحيات الموقع"));
        return false;
      }
      if (per == LocationPermission.whileInUse||per == LocationPermission.always||per == LocationPermission.unableToDetermine) {
        await getPos();
      } else {
        AppSnackbar.show(
            buildSnackBar(text: "من فضلك قم بتشغل الGPS بارسال موقعك"));

        lat = 360;
        lange = 360;
      }
    } else {
      await getPos();
    }

    return per == LocationPermission.whileInUse;
  }

  buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(children: [
        IconButton(
          onPressed: () {
            if (text_controller.text.isNotEmpty) {
              ref.read(chatNotifierProvider.notifier).sendMessage(
                    text_controller.text,
                    "text",
                    ref.read(authNotifierProvider).user!.id ?? 0,
                    widget.proposal.provider?.id ?? 0,
                    widget.proposal.id ?? 0,
                  );
              ref.read(chatNotifierProvider.notifier).sendNotification(
                    widget.proposal.provider?.firebase_token ?? "",
                    ref.read(authNotifierProvider).user!.name ?? "",
                    text_controller.text,
                  );
              text_controller.clear();
            }
          },
          icon: Image.asset(
            AppAssets.sendIcon,
            color: AppColors.primaryColor,
            width: 30,
          ),
        ),
        Expanded(
          child: TextField(
              controller: text_controller,
              decoration: const InputDecoration(
                hintText: 'أكتب رسالة',
                border: OutlineInputBorder(),
              )), // MyTextField
        ), //
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              await getPer().then((value) {
                                if (lat != 360 && lange != 360) {
                                  ref
                                      .read(chatNotifierProvider.notifier)
                                      .sendMessage(
                                        "$lat,$lange",
                                        "location",
                                        ref
                                                .read(authNotifierProvider)
                                                .user!
                                                .id ??
                                            0,
                                        widget.proposal.provider?.id ?? 0,
                                        widget.proposal.id ?? 0,
                                      )
                                      .then((value) => ref
                                          .read(chatNotifierProvider.notifier)
                                          .sendNotification(
                                            widget.proposal.provider
                                                    ?.firebase_token ??
                                                "",
                                            ref
                                                    .read(authNotifierProvider)
                                                    .user!
                                                    .name ??
                                                "",
                                            "ارسل اليك موقعا",
                                          ));
                                }
                              });
                            },
                            child: Text(
                              "مشاركة الموقع",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Divider(),
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: TextButton(
                            onPressed: () async {
                              ImagePicker pickerServiceCoverImage =
                                  ImagePicker();
                              XFile? pickedImg = await pickerServiceCoverImage
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedImg != null) {
                                ref
                                    .read(chatNotifierProvider.notifier)
                                    .uploadImage(
                                      ref.read(authNotifierProvider).user!.id ??
                                          0,
                                      widget.proposal.provider?.id ?? 0,
                                      widget.proposal.id ?? 0,
                                      pickedImg,
                                    )
                                    .then(
                                      (value) => ref
                                          .read(chatNotifierProvider.notifier)
                                          .sendNotification(
                                            widget.proposal.provider
                                                    ?.firebase_token ??
                                                "",
                                            ref
                                                    .read(authNotifierProvider)
                                                    .user!
                                                    .name ??
                                                "",
                                            "ارسل اليك صورة",
                                          ),
                                    );
                              } else {}
                              Navigator.pop(context);
                            },
                            child: Text(
                              "مشاركة صورة",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                      // Divider(),
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 70,
                      //   child: TextButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //         _showTextInputDialog(context);
                      //       },
                      //       child: Text(
                      //         "الغاء الطلب",
                      //         style: TextStyle(
                      //             color: AppColors.red,
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.bold),
                      //       )),
                      // ),
                    ],
                  ),
                );
              },
            );
          },
          icon: const Icon(
            CupertinoIcons.add,
            color: AppColors.primaryColor,
          ),
        ),
      ]),
    );
  }

  // Future<String?> _showTextInputDialog(
  //   BuildContext context,
  // ) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           width: double.infinity,
  //           child: AlertDialog(
  //             title: const Text('سبب الالغاء'),
  //             content: Form(
  //               key: _formKey,
  //               child: Container(
  //                 width: double.infinity,
  //                 // margin: const EdgeInsets.all(10.0),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(20),
  //                   border:
  //                       Border.all(color: AppColors.grayWhite), // Add a border
  //                 ),
  //                 height: 100.0, // Fixed height
  //                 child: SingleChildScrollView(
  //                   // Add a SingleChildScrollView for scrolling
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(10.0),
  //                     child: TextFormField(
  //                       controller: _textFieldController,
  //                       validator: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'من فضلك ادخل سبب الالغاء';
  //                         }
  //                         return null;
  //                       },
  //                       maxLines: null, // Allow multiple lines for notes
  //                       decoration: const InputDecoration(
  //                         hintText: 'اكتب سبب الالغاء',
  //                         border: InputBorder
  //                             .none, // Remove the default input border
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             actions: <Widget>[
  //               Center(
  //                 child: ElevatedButton(
  //                   style: ButtonStyle(
  //                     backgroundColor: MaterialStateProperty.all(AppColors.red),
  //                   ),
  //                   child: const Text('الغاء'),
  //                   onPressed: () async {
  //                     if (_formKey.currentState!.validate()) {
  //                       var result = await ref
  //                           .read(orderNotifierProvider.notifier)
  //                           .cancelProposal(widget.proposal.id ?? 0,
  //                               _textFieldController.text);
  //                       if (result != null && result.toString().isNotEmpty) {
  //                         AppSnackbar.show(buildSnackBar(
  //                             text: result.toString(),
  //                             backgroundColor: Colors.green));
  //                         _textFieldController.clear();
  //                         Navigator.pushNamedAndRemoveUntil(
  //                             context, Routes.initRoute, (route) => false);
  //                       }
  //                     }
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
}
