import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../../service_form/ui/widgets/widgets.dart';
import '../data/model/order_response.dart';
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


class ChooseProposalScreen extends StatefulHookConsumerWidget {
  final int projectId;
  const ChooseProposalScreen({super.key,required this.projectId});
  @override
  ConsumerState<ChooseProposalScreen> createState() => _chooseProposalScreenState();
}

class _chooseProposalScreenState extends ConsumerState<ChooseProposalScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(orderNotifierProvider.notifier).getActiveProposal(widget.projectId);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(),
            body: ref.watch(orderNotifierProvider).getProposalLoading
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
                : ref.read(orderNotifierProvider).proposals.isEmpty
                ? const Center(
              child: Text('لا يوجد عروض أسعار'),
            )
                : Padding(
              padding: const EdgeInsets.all(
                10.0,
              ),
              child: ListView.separated(
                itemCount: ref
                    .read(orderNotifierProvider)
                    .proposals.length,
                itemBuilder: (context, index) => ProposalItem(
                  proposal: ref
                      .read(orderNotifierProvider)
                      .proposals[index],
                ),
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
              ),
            )        ) );
  }
}

class ProposalItem extends ConsumerWidget {
  final Proposals proposal;
  final TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ProposalItem({Key? key, required this.proposal}) : super(key: key);


  Future<String?> _showTextInputDialog(
      BuildContext context,
      WidgetRef ref
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
                            .cancelProject(proposal.project!.id ?? 0,
                            _textFieldController.text);
                        if (result != null && result.toString().isNotEmpty) {
                          Navigator.pop(context);
                          AppSnackbar.show(buildSnackBar(
                              text: "تم الغاء المشروع بنجاح",
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: proposal.status != "cancelled"
          ? () {
        Navigator.pushNamed(context, Routes.requestServiceScreen,
            arguments: proposal)
            .then(
              (refresh) {
            ref.read(orderNotifierProvider.notifier).getOrderData();
          },
        );
      }
          : null,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                    )
                  ]),
              // height: 440,
              //    width: MediaQuery.of(context).size.width * 0.85,
              child: Column(children: [
                Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(AppAssets.done,
                          width: 100, height: 100, fit: BoxFit.fill),
                    )),
                const SizedBox(
                  width: 20,
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.tag),
                        Text("رقم الطلب"),
                      ],
                    ),
                    Text(proposal.project!.id.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 105, 105, 105))),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bar_chart_rounded),
                        Text("حالة الطلب"),
                      ],
                    ),
                    Text("بإنتظار تلقي العروض",
                        style: TextStyle(
                            color: Color.fromARGB(255, 105, 105, 105))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.settings),
                        Text(" الخدمة"),
                      ],
                    ),
                    Text(proposal.project!.name.toString() ?? "",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 105, 105, 105))),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 140,
                  height: 50,
                  child: whiteButtonTile(
                    textColor: Colors.white,
                    color: Colors.red,
                    title: "الغاء الطلب",
                    context: context,
                    pressed: () {
                      // Navigator.pop(context);
                      _showTextInputDialog(context ,  ref);
                    },
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius:
                BorderRadius.circular(10), // Adjust the radius as needed
                border: Border.all(color: Colors.grey, width: 1), // Add a gray border
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    blurRadius: 5, // Adjust the blur radius as needed
                    offset: Offset(0, 2), // Adjust the offset as needed
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the circular image here
                  Container(
                    width: 40, // Adjust the width as needed
                    height: 40, // Adjust the height as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: proposal.provider?.avatar ?? "",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Icon(
                        Icons.person, // Replace with any icon you want
                        size: 30,
                        color: Colors.grey, // Customize color if needed
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.person, // Replace with any icon you want
                        size: 30,
                        color: Colors.grey, // Customize color if needed
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Display the notification text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .28,
                        child: Text(
                          proposal.provider?.name ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            'منذ ',
                            style: TextStyle(color: AppColors.black, fontSize: 11),
                          ),
                          Text(
                            // Calculate the time difference from notification.date to now
                            getTimeDifference(DateTime.parse(proposal.created_at ??
                                "2023-10-21T09:18:23.000000Z")),
                            style: const TextStyle(color: AppColors.black, fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: proposal.status == "accepted"
                              ? getStatusForProject(proposal.project!.status!)!
                              .statusColor
                              : getStatusForProposal(proposal.status!)!.statusColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        child: Text(
                          proposal.status == "accepted"
                              ? getStatusForProject(proposal.project!.status!)!
                              .statusTitle
                              : getStatusForProposal(proposal.status!)!.statusTitle,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'السعر ',
                            style: TextStyle(color: AppColors.black, fontSize: 11),
                          ),
                          Text(
                            '${(proposal.price!.toDouble() + proposal.project!.equipment_cost.toDouble()).toStringAsFixed(2)} ريال',
                            style: const TextStyle(color: AppColors.black, fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration underLineDecoration() {
  return const BoxDecoration(
      border:
      Border(bottom: BorderSide(width: 3, color: AppColors.primaryColor)));
}

TextStyle selectedSegmentTextStyle() {
  return const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primaryColor);
}

TextStyle unSelectedSegmentTextStyle() {
  return const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black);
}

class StatusModel {
  final String statusTitle;
  final Color statusColor;

  StatusModel({required this.statusTitle, required this.statusColor});
}

StatusModel? getStatusForProject(String status) {
  switch (status) {
    case "pending":
      return StatusModel(statusTitle: "الانتظار", statusColor: Colors.grey);
    case "opened":
      return StatusModel(
          statusTitle: "في انتظار تلقي العروض ", statusColor: Colors.blueGrey);
    case "closed":
      return StatusModel(
          statusTitle: "تم اغلاق المشروع من العميل ", statusColor: Colors.red);
    case "cancelled":
      return StatusModel(
          statusTitle: "تم الإلغاء ", statusColor: Colors.redAccent);
    case "progress":
      return StatusModel(
          statusTitle: " قيد التنفيذ", statusColor: Colors.orange);
    case "under_review":
      return StatusModel(
          statusTitle: "في انتظار الدفع", statusColor: Colors.blue);
    case "completed":
      return StatusModel(statusTitle: "مكتمل", statusColor: Colors.green);
    default:
      return StatusModel(statusTitle: status, statusColor: Colors.cyan);
  }
}

StatusModel? getStatusForProposal(String status) {
  switch (status) {
    case "wait":
      return StatusModel(statusTitle: "قيد الانتظار", statusColor: Colors.grey);
    case "accepted":
      return StatusModel(
          statusTitle: "تم قبول عرضك من العميل ", statusColor: Colors.green);
    case "refused":
      return StatusModel(
          statusTitle: "تم رفض عرضك من العميل ", statusColor: Colors.red);
    case "cancelled":
      return StatusModel(statusTitle: "تم الالغاء", statusColor: Colors.red);
    default:
      return StatusModel(statusTitle: status, statusColor: Colors.red);
  }
}
