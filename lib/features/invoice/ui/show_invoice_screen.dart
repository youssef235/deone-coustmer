// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:wasq/features/invoice/data/model/invoice.dart';
// import 'package:wasq/features/invoice/data/provider/invoice_provider.dart';
// import 'package:wasq/features/invoice/moyasar/config.dart';
// import 'package:wasq/features/notifications/ui/widgets.dart';
// import 'package:wasq/features/orders/data/model/order_response.dart';
// import 'package:wasq/features/service_form/ui/widgets/widgets.dart';
// import 'package:wasq/theme/app_assets.dart';
// import 'package:wasq/theme/app_colors.dart';
// import 'package:wasq/utils/utils.dart';
//
// import 'package:moyasar/moyasar.dart';
//
// import '../../../app/widgets/gallery.dart';
// import 'invoice_screen.dart';
//
// class ShowInvoiceScreen extends StatefulHookConsumerWidget {
//   final Proposals proposals;
//   const ShowInvoiceScreen({super.key, required this.proposals});
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ShowInvoiceScreenState();
// }
//
// class _ShowInvoiceScreenState extends ConsumerState<ShowInvoiceScreen> {
//   TextEditingController cost = TextEditingController();
//   TextEditingController notesController = TextEditingController();
//   String? initialNoteValue;
//   Invoice? invoice;
//   List<GalleryItem> galaryImages = [];
//
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 0), () async {
//       ref
//           .read(invoiceNotifierProvider.notifier)
//           .getInvoice(widget.proposals.project!.id!);
//     });
//
//     Future.delayed(const Duration(seconds: 0), () {
//       if (widget.proposals.project!.attachment_images!.isNotEmpty) {
//         galaryImages = widget.proposals.project!.attachment_images!
//             .map((e) => GalleryItem(id: e.id.toString(), resource: e.url ?? ""))
//             .toList();
//       }
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     invoice = ref.watch(invoiceNotifierProvider).invoiceResponse;
//     if (invoice != null) {
//       if (invoice!.attachments!.isNotEmpty) {
//         galaryImages = invoice!.attachments!
//             .map((e) => GalleryItem(id: e.id.toString(), resource: e.url ?? ""))
//             .toList();
//       }
//     }
//
//     return Scaffold(
//         appBar: AppBar(
//             centerTitle: true,
//             actions: [
//               Image.asset(AppAssets.logo,
//                   width: MediaQuery.of(context).size.width * 0.15,
//                   height: MediaQuery.of(context).size.width * 0.15),
//             ],
//             title: Text(
//               "تصفح الفاتوره",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             )),
//         body: ref.watch(invoiceNotifierProvider).loading
//             ? const Center(child: CircularProgressIndicator())
//             : userView());
//   }
//
//   Widget userView() {
//     if (invoice == null) {
//       return Center(
//         child: Text("لم يقم الفني بإرفاق فاتورة"),
//       );
//     }
//
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//             child: Column(
//           children: [
//             TextContainer(
//                 text: "تكاليف المشتريات :" +
//                     invoice!.equipmentCost.toString() +
//                     "ريال"),
//             const SizedBox(
//               height: 10,
//             ),
//             if (invoice?.attachments?.isNotEmpty ?? false)
//               Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.058,
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     open(context, 0, galaryImages);
//                   },
//                   child: const Text(
//                     "الاطلاع على فاتورة المشتريات وصور القطع",
//                     style: TextStyle(
//                       fontSize: 16,
//                       letterSpacing: 0,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: whiteButtonTile(
//                 small: true,
//                 context: context,
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 title: "تحميل الفاتورة",
//                 //      color: AppColors.primaryColor,
//                 pressed: () async {
//                   var res = await ref
//                       .read(invoiceNotifierProvider.notifier)
//                       .getInvoicePdf(invoice!.id ?? 0);
//                   if (res != null) {
//                     final Uri url = Uri.parse(res ?? "");
//                     if (!await launchUrl(url)) {
//                       throw Exception('Could not launch pdf');
//                     }
//                   }
//                 },
//               ),
//             ),
//           ],
//         )));
//   }
// }
