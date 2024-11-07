import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:wasq/utils/utils.dart';

import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../orders/data/providers/order_provider.dart';
import '../data/providers/service_form_provider.dart';
import 'widgets/widgets.dart';

class ProjectUploadedPage extends StatefulHookConsumerWidget {
  final Project project;
  const ProjectUploadedPage({super.key, required this.project});

  @override
  ConsumerState<ProjectUploadedPage> createState() =>
      _ProjectUploadedPageState();
}

class _ProjectUploadedPageState extends ConsumerState<ProjectUploadedPage> {
  TextEditingController text_controller = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("تفاصيل الطلب",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        body: ref.watch(orderNotifierProvider).loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(children: [
                      Center(
                          child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset(AppAssets.done,
                            width: 150, height: 150, fit: BoxFit.fill),
                      )),
                      const SizedBox(
                        width: 50,
                        height: 50,
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
                          Text(widget.project.id.toString(),
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
                          Text(widget.project.name ?? "",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 105, 105, 105))),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Row(
                      //       children: [
                      //         Icon( Icons.alarm) ,
                      //         Text(" الوقت"),
                      //       ],
                      //     ),
                      //     Text(widget.project.available_time!=null ? DateFormat("yyyy-MM-dd").parse(widget.project.available_time!).toString().split(" ")[0].toString() : "None ", style: const TextStyle(color: Color.fromARGB(255, 105, 105, 105))),
                      //   ],),
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
                            _showTextInputDialog(context);
                          },
                        ),
                      ),
                    ]),
                  ),
                  ref.watch(orderNotifierProvider).loading
                      ? Center(child: Lottie.asset(AppAssets.loading))
                      : Expanded(
                          child: StreamBuilder(
                            stream: ref.watch(serviceFormNotifierProvider.notifier).getOffers(/*widget.project.id ?? 0*/56),
                            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              // تحقق من حالة الاتصال
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }

                              // تحقق من وجود خطأ
                              else if (snapshot.hasError) {
                                return Center(
                                  child: Text('حدث خطأ ما: ${snapshot.error}'),
                                );
                              }

                              // تحقق من وجود بيانات
                              else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return buildOfferItem(snapshot.data!.docs[index]);
                                  },
                                );
                              }

                              // حالة عدم وجود بيانات
                              else {
                                return Center(
                                  child: const Text("ستصلك عروض الفنيين في أقرب وقت", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                );
                              }
                            },
                          )

                  ),
                ],
              ),
      ),
    );
  }

  Widget buildOfferItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return InkWell(
      onTap: () async {
        final result = await ref
            .read(orderNotifierProvider.notifier)
            .getProposal(data["id"]);
        if (result != null) {
          Navigator.pushNamed(context, Routes.requestServiceScreen,
              arguments: result);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 206, 206, 206),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
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
                imageUrl: data["avatar"] ?? "",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Image.asset(AppAssets.recLogo, fit: BoxFit.fitWidth),
                errorWidget: (context, url, error) =>
                    Image.asset(AppAssets.recLogo, fit: BoxFit.fitWidth),
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
                    data["name"] ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(
                      data["description"],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
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
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${data["price"].toStringAsFixed(2)} ريال',
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'التقييم ',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${data["avg_rate"]}',
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
                            .cancelProject(widget.project.id ?? 0,
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
}
