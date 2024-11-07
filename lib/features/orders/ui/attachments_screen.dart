// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:wasq/features/orders/data/model/order_response.dart';
// import 'package:video_player/video_player.dart';
// import 'package:wasq/theme/app_assets.dart';
// import 'package:wasq/theme/app_colors.dart';
//
// import '../../../app/widgets/gallery.dart';
//
// class AttachmetsScreen extends StatefulWidget {
//   final Project project;
//   const AttachmetsScreen({super.key, required this.project});
//
//   @override
//   State<AttachmetsScreen> createState() => _AttachmetsScreenState();
// }
//
// class _AttachmetsScreenState extends State<AttachmetsScreen> {
//   late AudioPlayer _audioPlayer;
//   bool isPlaying = false;
//   List<GalleryItem> galaryImages = [];
//
//   late VideoPlayerController _controller;
//
//   initState() {
//     Future.delayed(const Duration(seconds: 0), () {
//       if (widget.proposal.project!.attachment_images!.isNotEmpty) {
//         galaryImages = widget.proposal.project!.attachment_images!
//             .map((e) => GalleryItem(id: e.id.toString(), resource: e.url ?? ""))
//             .toList();
//       }
//       if (widget.proposal.project!.attachments_videos != null &&
//           widget.proposal.project!.attachments_videos!.isNotEmpty &&
//           widget.proposal.project!.attachments_videos?[0].url != null &&
//           widget.proposal.project!.attachments_videos?[0].url != "") {
//         _controller = VideoPlayerController.networkUrl(
//           Uri.parse(widget.proposal.project!.attachments_videos![0].url!),
//         )..initialize().then((_) {
//             _controller.setLooping(true);
//             setState(() {});
//           });
//       }
//       _audioPlayer = AudioPlayer();
//       ref
//           .read(notificationsNotifierProvider.notifier)
//           .getAddressFromCoordinates(
//               double.parse(widget.proposal.project?.location_lat ?? "0"),
//               double.parse(widget.proposal.project?.location_lang ?? "0"));
//     });
//
//     print("project is ${widget.project}");
//     if (widget.project.attachments_videos != null &&
//         widget.project.attachments_videos!.isNotEmpty &&
//         widget.project.attachments_videos?[0].url != null &&
//         widget.project.attachments_videos?[0].url != "") {
//       _controller = VideoPlayerController.networkUrl(
//         Uri.parse(widget.project.attachments_videos![0].url!),
//       )..initialize().then((_) {
//           _controller.setLooping(true);
//           setState(() {});
//         });
//     }
//     _audioPlayer = AudioPlayer();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     if (widget.project.attachments_videos != null &&
//         widget.project.attachments_videos!.isNotEmpty &&
//         widget.project.attachments_videos?[0].url != null &&
//         widget.project.attachments_videos?[0].url != "") {
//       _controller.dispose();
//     }
//     _audioPlayer.dispose();
//     super.dispose();
//   }
//
//   Future<void> _playRecording() async {
//     if (widget.project.attachment_audios?[0].url != null &&
//         widget.project.attachment_audios?[0].url != "") {
//       setState(() {
//         isPlaying = true;
//       });
//       print("audio source iz ${widget.project.attachment_audios![0].url!}");
//       await _audioPlayer.setUrl(widget.project.attachment_audios![0].url!);
//       await _audioPlayer.play();
//     } else {
//       print('No recorded audio to play');
//     }
//   }
//
//   Future<void> _pauseRecording() async {
//     if (widget.project.attachment_audios?[0].url != null &&
//         widget.project.attachment_audios?[0].url != "") {
//       await _audioPlayer.pause();
//       setState(() {
//         isPlaying = false;
//       });
//     } else {
//       print('No recorded audio to pause');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('رجوع'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           if (widget.project.attachments_videos!.isEmpty &&
//               widget.project.attachment_audios!.isEmpty &&
//               widget.project.attachment_images!.isEmpty)
//             Center(child: Text("لا يوجد مرفقات")),
//           if (widget.project.attachments_videos!.isNotEmpty &&
//               widget.project.attachments_videos?[0].url != null &&
//               widget.project.attachments_videos?[0].url != "" &&
//               _controller.value.isInitialized)
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "الفيديو المسجل من العميل",
//                     style: TextStyle(
//                         color: AppColors.primaryColor,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: AspectRatio(
//                             aspectRatio: _controller.value.aspectRatio,
//                             child: VideoPlayer(_controller),
//                           ),
//                         ),
//                         Visibility(
//                           visible: !_controller.value.isPlaying,
//                           child: Icon(
//                             color: AppColors.grayWhite,
//                             Icons.play_circle,
//                             size: MediaQuery.of(context).size.width *
//                                 0.15, // Adjust the size as needed
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           if (widget.project.attachment_audios!.isNotEmpty &&
//               widget.project.attachment_audios?[0].url != null &&
//               widget.project.attachment_audios?[0].url != "")
//             Container(
//               width: MediaQuery.of(context).size.width * 0.88,
//               height: MediaQuery.of(context).size.height * 0.068,
//               margin: const EdgeInsets.symmetric(vertical: 16),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryColor,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: TextButton(
//                 onPressed: isPlaying ? _pauseRecording : _playRecording,
//                 child: Row(
//                   children: [
//                     Text(
//                       isPlaying ? "ايقاف \nالتسجيل" : "تشغيل \nالتسجيل",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const Spacer(),
//                     Icon(
//                       isPlaying ? Icons.stop_circle : Icons.play_circle,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           if (widget.project.attachment_images!.isNotEmpty)
//             Container(
//               height: 120,
//               margin: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: AppColors.grayWhite, width: 1),
//               ),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width:
//                           100, // Customize the width of the container as needed
//                       height:
//                           100, // Customize the height of the container as needed
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             5), // Adjust the radius as needed for curved edges
//                         border: Border.all(
//                             color: AppColors.primaryColor,
//                             width: 2), // Customize border properties
//                       ),
//                       child: CachedNetworkImage(
//                         imageUrl:
//                             widget.project.attachment_images?[index].url ?? "",
//                         imageBuilder: (context, imageProvider) => Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             image: DecorationImage(
//                               image: imageProvider,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         placeholder: (context, url) => Image.asset(
//                             AppAssets.recLogo,
//                             fit: BoxFit.fitWidth),
//                         errorWidget: (context, url, error) => Image.asset(
//                             AppAssets.recLogo,
//                             fit: BoxFit.fitWidth),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: widget.project.attachment_images?.length,
//               ),
//             ),
//           Divider(),
//         ],
//       )),
//     );
//   }
// }
