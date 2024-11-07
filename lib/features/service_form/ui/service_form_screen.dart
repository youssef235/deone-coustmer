import 'dart:async';
import 'dart:io';
import 'dart:math';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:wasq/app/app.dart';
import 'package:wasq/app/app_keys.dart';
import 'package:wasq/app/routes.dart';
import 'package:wasq/features/home/data/providers/home_provider.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:wasq/features/orders/data/providers/order_provider.dart';
import 'package:wasq/features/service_form/ui/widgets/pick_image.dart';
import 'package:wasq/features/service_form/ui/widgets/timePickerTheme.dart';
import 'package:wasq/features/service_form/ui/widgets/widgets.dart';
import 'package:wasq/theme/app_assets.dart';
import 'package:wasq/utils/constants.dart';
import 'package:wasq/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasq/features/home/data/models/home_response.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../../app/widgets/animation/shimmer/shimmer_loading_anim.dart';
import '../../../app/widgets/wave_visualizer.dart';
import '../../../theme/app_colors.dart';
import '../data/models/service_form_response.dart';
import '../data/providers/service_form_provider.dart';
import 'package:path_provider/path_provider.dart';

import 'map.dart';

class ServiceFormScreen extends StatefulHookConsumerWidget {
  final Service service;
  ServiceFormScreen({super.key, required this.service});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceFormScreenState();
}

class _ServiceFormScreenState extends ConsumerState<ServiceFormScreen> {
  var timePickerTheme;
  bool data_selected_now = true;
  bool can_add_images = false;
  //FlutterSoundRecorder? _audioRecorder;

  // FlutterAudioRecorder2? _recorder;
  bool _isRecording = false;
  String _filePath = '';
  // Recording? _recording;
  bool isRecording = false;
  bool isPlaying = false;
  String? recordedFilePath;
  late AudioPlayer _audioPlayer;
  final notesController = TextEditingController();
  List<XFile?>? pickedImages;
  XFile? pickedVideo;

  var videoThumbnail;

  Future<bool> getPer() async {
    LocationPermission per;
    bool services;

    // Check the current location permission status
    per = await Geolocator.checkPermission();

    // Display disclosure dialog if permission is denied
    if (per == LocationPermission.denied) {
      await Geolocator.requestPermission();
      // bool userAgreed = await showDisclosureDialog(context);

      // if (userAgreed) {
      //   // User agreed to the disclosure, proceed to request location permission
      //   per = await Geolocator.requestPermission();
      // } else {
      //   // User disagreed to the disclosure, handle accordingly
      //   AppSnackbar.show(buildSnackBar(
      //       text: "لتجربة أفضل من فضلك اعطي التطبيق صلاحيات الموقع"));
      //   return false;
      // }
    } else {
      services = await Geolocator.isLocationServiceEnabled();

      if (services != true) {
        per = await Geolocator.requestPermission();
      }
    }

    per = await Geolocator.requestPermission();
    return per == LocationPermission.whileInUse;
  }

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      await getPer();
      await getCurrentPosition();
    });
    //_audioRecorder = FlutterSoundRecorder();
    // _initializeRecorder();

  //  _audioRecorder?.openAudioSession();
    _audioPlayer = AudioPlayer();
  }
// Initialize the audio recorder
//   Future<void> _initializeRecorder() async {
//     final directory = await getApplicationDocumentsDirectory();
//     String filePath = '${directory.path}/audio_recording.wav';
//     _recorder = FlutterAudioRecorder2(filePath, audioFormat: AudioFormat.WAV);
//     await _recorder?.initialized;
//   }
//
//   // Start recording
//   Future<void> _startRecording() async {
//     try {
//       await _recorder?.start();
//       setState(() {
//         _isRecording = true;
//       });
//       print("Recording started");
//     } catch (e) {
//       print("Error starting recording: $e");
//     }
//   }
//
//   // Stop recording
//   Future<void> _stopRecording() async {
//     try {
//       _recording = await _recorder?.stop();
//       setState(() {
//         _isRecording = false;
//       });
//       print("Recording stopped, saved at: ${_recording?.path}");
//     } catch (e) {
//       print("Error stopping recording: $e");
//     }
//   }
  @override
  void dispose() {
   /// _audioRecorder?.closeAudioSession();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future getCurrentPosition() async {
    if (Constants.lang == -360 || Constants.lat == -360)
      return;
    else {
      await ref
          .read(orderNotifierProvider.notifier)
          .getAddressFromCoordinates(Constants.lat, Constants.lang);
    }
  }




  Future<void> _pauseRecording() async {
    if (recordedFilePath != null) {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      print('No recorded audio to pause');
    }
  }

  TimeOfDay selected_time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    timePickerTheme = TimePickerThemeData(
      backgroundColor: Colors.white,
      hourMinuteShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.white, width: 4),
      ),
      dayPeriodBorderSide: const BorderSide(color: Colors.white, width: 4),
      // dayPeriodColor: Colors.blueGrey.shade600,
      dayPeriodColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? const Color.fromARGB(255, 97, 107, 112)
              : Colors.blueGrey.shade800),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.white, width: 4),
      ),
      dayPeriodTextColor: Colors.white,
      dayPeriodShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.blueGrey, width: 4),
      ),
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? Colors.blueGrey.shade800
              : Colors.blueGrey.shade800),
      hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? Colors.white
              : Colors.white),
      dialHandColor: Colors.blueGrey.shade700,
      dialBackgroundColor: Colors.blueGrey.shade800,
      hourMinuteTextStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodTextStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      helpTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0)),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
      ),
      dialTextColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? AppColors.primaryColor
              : Colors.white),
      entryModeIconColor: AppColors.primaryColor,
    );

    ref.listen(
        serviceFormNotifierProvider.select((value) => value.errorMessage),
        (previous, nextErrorMessage) {
      if (nextErrorMessage != null && nextErrorMessage != '') {
        AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
        Future.delayed(const Duration(seconds: 3), () {
          ref.read(serviceFormNotifierProvider.notifier).resetErrorMessage();
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.service.name ?? "",
            style: const TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: ref.watch(serviceFormNotifierProvider).loading
            ? ShimmerLoadingAnim(
                isLoading: ref.watch(serviceFormNotifierProvider).loading,
                child: _buildShimmerServiceForm())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: AppKeys.serviceFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'res/assets/newRequest.svg',
                        height: 200.h,
                      ),
                      SizedBox(
                        height: 10,
                      ),


                      whiteButtonTile(
                          iconLeft: true,
                          context: context,
                          pressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LocationAccess()));
                            getCurrentPosition();
                            setState(() {});
                          },
                          fontSize: 14,
                          title: Constants.lang == -360 || Constants.lat == -360
                              ? "مكان التحميل"
                              : ref.watch(orderNotifierProvider).add,
                          icon: Icons.location_on),

                      const SizedBox(height: 10),

                      widget.service.has_two_location == 'true'
                          ? whiteButtonTile(
                              iconLeft: true,
                              context: context,
                              pressed: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LocationAccess(
                                              isDestinationLocation: true,
                                              widgetRef: ref,
                                            )));
                                ref
                                    .read(orderNotifierProvider.notifier)
                                    .getDestinationAddressFromCoordinates(
                                      ref
                                          .read(serviceFormNotifierProvider)
                                          .destinationLat,
                                      ref
                                          .read(serviceFormNotifierProvider)
                                          .destinationLang,
                                    );
                              },
                              fontSize: 14,
                              title: ref
                                          .watch(orderNotifierProvider)
                                          .destinationAdd ==
                                      ""
                                  ? "مكان التنزيل"
                                  : ref
                                      .read(orderNotifierProvider)
                                      .destinationAdd,
                              icon: Icons.location_on)
                          : SizedBox(),

                      const SizedBox(height: 10),

                      const SizedBox(
                        height: 20,
                      ),

                      ImagesPicker(onImagePicked: (images) {
                        pickedImages = images;
                        setState(() {});
                      }),
                      //     Divider(),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (pickedVideo != null)
                                imageCard(videoThumbnail, () {
                                  videoThumbnail = null;
                                  pickedVideo = null;
                                  setState(() {});
                                }, isVideo: true),
                              if (pickedImages != null)
                                for (var image in pickedImages!)
                                  imageCard(image, () {
                                    pickedImages!.remove(image);
                                    setState(() {});
                                  }),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.grayWhite), // Add a border
                        ),
                        height: 150.0, // Fixed height
                        child: SingleChildScrollView(
                          // Add a SingleChildScrollView for scrolling
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "ملحوظات السائق",
                                  // style: TextStyle(
                                  //     fontSize: 16,
                                  //     color: AppColors.primaryColor),
                                ),
                                TextFormField(
                                  controller: notesController,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'من فضلك ادخل ملحوظاتك';
                                  //   }
                                  //   return null;
                                  // },
                                  maxLines:
                                      null, // Allow multiple lines for notes
                                  decoration: InputDecoration(
                                    hintText: ('.' * 100),

                                    border: InputBorder
                                        .none, // Remove the default input border
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.893,
                        height: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            var date = DateTime.now();
                            date = date.copyWith(
                                hour: selected_time.hour,
                                minute: selected_time.minute);

                            if (Constants.lang == -360 ||
                                Constants.lat == -360) {
                              AppSnackbar.show(buildSnackBar(
                                  text: "من فضلك قم بتحديد موقعك"));
                              return;
                            }
                            if (AppKeys.serviceFormKey.currentState!
                                .validate()) {
                              var result = await ref
                                  .read(serviceFormNotifierProvider.notifier)
                                  .submitServiceForm(
                                    date: date,
                                    service_id: widget.service.id ?? 0,
                                    description: notesController.text,
                                    audioPath: recordedFilePath,
                                    pickedImages: pickedImages,
                                    pickedVideo: pickedVideo,
                                    lat: Constants.lat,
                                    lang: Constants.lang,
                                    destinationLat: ref
                                        .read(serviceFormNotifierProvider)
                                        .destinationLat,
                                    destinationLang: ref
                                        .read(serviceFormNotifierProvider)
                                        .destinationLang,
                                  );
                              if (result != null) {
                                var pr = result['project'];
                                var proj = Project(
                                  id: pr['id'] ?? 0,
                                  available_time: pr['available_time'],
                                  name: pr['name'] ?? "name",
                                  date: "",
                                  description: "",
                                  location_lang: Constants.lang,
                                  location_lat: Constants.lat,
                                  reviewed: false,
                                  status: "",
                                );
                                await Navigator.pushNamed(
                                    context, Routes.projectUploaded,
                                    arguments: proj);

                                ScaffoldMessenger.of(context).showSnackBar(
                                    buildSnackBar(
                                        text: 'تم نشر المهمة بنجاح',
                                        backgroundColor: Colors.green));
                                Navigator.pop(context);
                                ref
                                    .read(homeNotifierProvider.notifier)
                                    .changePageIndex(1);
                              }
                            }
                          },
                          child: const Text(
                            'ارسال الطلب',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  _buildShimmerServiceForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.grayWhite), // Add a border
            ),
            height: 150.0, // Fixed height
            child: SingleChildScrollView(
              // Add a SingleChildScrollView for scrolling
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ملحوظات",
                      style: TextStyle(
                          fontSize: 16, color: AppColors.primaryColor),
                    ),
                    TextFormField(
                      controller: notesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك ادخل ملحوظاتك';
                        }
                        return null;
                      },
                      maxLines: null, // Allow multiple lines for notes
                      decoration: const InputDecoration(
                        hintText: 'اكتب ملحوظاتك هنا',
                        border:
                            InputBorder.none, // Remove the default input border
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.maxFinite,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                  side: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 3,
                  ),
                ),
              ),
              onPressed: null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 2.0,
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          isRecording ? Icons.stop : Icons.mic,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                    const Spacer(),
                    isRecording
                        ? SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: WaveVisualizer(
                              columnHeight: 40,
                              columnWidth: 10,
                              isPaused: false,
                              isBarVisible: false,
                              color: AppColors.white,
                            ),
                          )
                        : const Text(
                            'سجل',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.white,
                            ),
                          ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.44,
                height: MediaQuery.of(context).size.height * 0.068,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: null,
                  child: Row(
                    children: [
                      Text(
                        isPlaying ? "ايقاف \nالتسجيل" : "تشغيل \nالتسجيل",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isPlaying ? Icons.stop_circle : Icons.play_circle,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.44,
                height: MediaQuery.of(context).size.height * 0.068,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const TextButton(
                  onPressed: null,
                  child: Row(
                    children: [
                      Text(
                        'مسح \nالتسجيل',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // if (can_add_images) ImagesPicker(
          //     onImagePicked: (images) {
          //       pickedImages = images;
          //     }),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.893,
            height: MediaQuery.of(context).size.height * 0.068,
            decoration: BoxDecoration(
              color: AppColors.green6E,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const TextButton(
              onPressed: null,
              child: Text(
                'تسجيل الطلب',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<ImageProvider<Object>> _generateThumbnail(String path) async {
  final thumbnailAsUint8List = await VideoThumbnail.thumbnailData(
    video: path,
    imageFormat: ImageFormat.JPEG,
    maxWidth:
        320, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
    quality: 50,
  );
  return MemoryImage(thumbnailAsUint8List!);
}

Widget imageCard(image, deleteAction, {bool isVideo = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100, // Customize the width of the container as needed
          height: 100, // Customize the height of the container as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                20), // Adjust the radius as needed for curved edges
            border: Border.all(
                color: AppColors.primaryColor,
                width: 2), // Customize border properties
            image: DecorationImage(
              image: image != null
                  ? (isVideo ? image : FileImage(File(image!.path)))
                  : const AssetImage("res/assets/logo_rec.png")
                      as ImageProvider,
              fit: BoxFit.cover, // You can customize the fit property
            ),
          ),
        ),
        if (isVideo)
          const Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 40,
          ),
        Positioned(
          right: -10,
          top: -10,
          child: IconButton(
            icon: const Icon(
              Icons.cancel,
              color: Color.fromARGB(255, 10, 10, 10),
            ),
            onPressed: deleteAction,
          ),
        ),
      ],
    ),
  );
}
