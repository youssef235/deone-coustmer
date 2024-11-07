import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasq/features/invoice/data/model/invoice.dart';
import 'package:wasq/features/invoice/data/provider/invoice_provider.dart';
import 'package:wasq/features/invoice/moyasar/config.dart';
import 'package:wasq/features/notifications/ui/widgets.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:wasq/features/payment/payment_view.dart';
import 'package:wasq/features/service_form/ui/widgets/widgets.dart';
import 'package:wasq/theme/app_assets.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:wasq/utils/utils.dart';

import 'package:moyasar/moyasar.dart';

import '../../../app/widgets/gallery.dart';

class InvoiceScreen extends StatefulHookConsumerWidget {
  final Proposals proposals;
  const InvoiceScreen({super.key, required this.proposals});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends ConsumerState<InvoiceScreen> {
  TextEditingController cost = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String? initialNoteValue;
  Invoice? invoice;
  List<GalleryItem> galaryImages = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      try {
        await ref.read(invoiceNotifierProvider.notifier).getInvoice(widget.proposals.project!.id!);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("خطأ في تحميل الفاتورة: $e")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    invoice = ref.watch(invoiceNotifierProvider).invoiceResponse;
    if (invoice != null) {
      if (invoice!.attachments!.isNotEmpty) {
        galaryImages = invoice!.attachments!
            .map((e) => GalleryItem(id: e.id.toString(), resource: e.url ?? ""))
            .toList();
      }
    }

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,

            title: const Text(
              "الدفع",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
        body: ref.watch(invoiceNotifierProvider).loading
            ? const Center(child: CircularProgressIndicator())
            : userView(ref));
  }

  Widget userView(WidgetRef ref) {
    if (invoice == null) {
      return const Center(
        child: Text("لم يقم الفني بإرفاق فاتورة"),
      );
    }

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40,
              ),



              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "طريقة الدفع",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff1A1A1A),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              invoice?.status != "paid"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PaymentWidget(
                              image: 'apple.png',
                              isSvg: false,
                              isSelected: ref
                                      .watch(invoiceNotifierProvider)
                                      .selectedPaymentString ==
                                  'apple',
                              ontap: () async {
                                ref
                                    .read(invoiceNotifierProvider.notifier)
                                    .setSelectedPaymentString('apple');

                              },
                            ),
                            SizedBox(
                              width: 20.h,
                            ),
                            PaymentWidget(
                              image: 'mada.svg',
                              isSelected: ref
                                      .watch(invoiceNotifierProvider)
                                      .selectedPaymentString ==
                                  'mada',
                              ontap: () async {
                                ref
                                    .read(invoiceNotifierProvider.notifier)
                                    .setSelectedPaymentString('mada');

                              },
                            ),
                            SizedBox(
                              width: 20.h,
                            ),
                            PaymentWidget(
                              image: 'card.svg',
                              isSelected: ref
                                      .watch(invoiceNotifierProvider)
                                      .selectedPaymentString ==
                                  'card',
                              ontap: () async {
                                ref
                                    .read(invoiceNotifierProvider.notifier)
                                    .setSelectedPaymentString('card');

                              },
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),


                        const SizedBox(
                          height: 30,
                        ),
                        Divider(),
                        const SizedBox(
                          height: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ملخص الطلب',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${(invoice!.projectCost)!.toStringAsFixed(2)}  ',
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                        const TextSpan(
                                            text: 'ريال',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Color(0xff9796A1))),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "المبلغ",
                                    style: TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Color(0xffF1F2F3),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${(invoice!.equipmentCost!).toStringAsFixed(2)} ',
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                        const TextSpan(
                                            text: 'ريال',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Color(0xff9796A1))),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "تكلفة المشتريات",
                                    style: TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Color(0xffF1F2F3),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${invoice!.totalCost!.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                        const TextSpan(
                                            text: ' ريال',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Color(0xff9796A1))),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "اجمالي",
                                    style: TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 218.h,
                              ),
                              ref
                                          .watch(invoiceNotifierProvider)
                                          .selectedPaymentString !=
                                      ''
                                  ? Container(
                                width: MediaQuery.of(context).size.width * 0.893,
                                height: 54.h,
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    String? res;

                                    // تحقق من نوع الدفع
                                    if (ref.read(invoiceNotifierProvider).selectedPaymentString == 'apple') {
                                      res = await ref.read(invoiceNotifierProvider.notifier).createPayment(
                                        paymentMethod: 'APPLE_PAY',
                                        invoiceID: invoice!.id!,
                                        orderID: invoice!.invoiceNo,
                                        name: widget.proposals.project!.name ?? "",
                                      );
                                    } else {
                                      res = await ref.read(invoiceNotifierProvider.notifier).createPayment(
                                        invoiceID: invoice!.id!,
                                        orderID: invoice!.invoiceNo,
                                        name: widget.proposals.project!.name ?? "",
                                      );
                                    }

                                    if (res != null) {
                                      // الانتقال إلى صفحة الدفع مع الرابط
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return PaymentWebView(
                                            url: res!,
                                            proposals: widget.proposals,
                                          );
                                        },
                                      ));
                                    } else {
                                      // عرض رسالة الخطأ للمستخدم
                                      String errorMessage = ref.read(invoiceNotifierProvider.notifier).state.errorMessage;
                                      print("خطأ في عملية الدفع: $errorMessage");

                                      // يمكنك طباعة الرابط هنا إذا كان ضروريًا
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("حدث خطأ: $errorMessage"))
                                      );
                                    }

                                  },
                                  child: const Text(
                                    'تاكيد',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )


                                  : SizedBox(),
                            ],
                          ),
                        ),


                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (invoice?.attachments?.isNotEmpty ?? false)
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.058,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                open(context, 0, galaryImages);
                              },
                              child: const Text(
                                "الاطلاع على فاتورة المشتريات وصور القطع",
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: .5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),


                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset(AppAssets.done,
                              width: 150, height: 150, fit: BoxFit.fill),
                        ),
                        const Text(
                          "تم الدفع",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (invoice!.status == 'paid')
                          whiteButtonTile(
                            small: true,
                            context: context,
                            title: "تحميل الفاتورة",
                            color: AppColors.primaryColor,
                            pressed: () async {
                              var res = await ref
                                  .read(invoiceNotifierProvider.notifier)
                                  .getInvoicePdf(invoice!.id ?? 0);
                              if (res != null) {
                                final Uri url = Uri.parse(res ?? "");
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch pdf');
                                }
                              }
                            },
                          )
                      ],
                    )
            ],
          ),
        ));
  }
}

class PaymentWidget extends StatefulWidget {
  final VoidCallback? ontap;
  final String image;
  final bool? isSvg;
  final bool? isSelected;
  const PaymentWidget(
      {super.key,
      this.ontap,
      required this.image,
      this.isSvg,
      this.isSelected});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.ontap!();
      },
      child: Container(
        height: 46.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: widget.isSelected == false ? Colors.white : Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.12),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(
                  0,
                  2,
                ),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffC2BDBD),
              width: 0.1,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.image == 'card.svg'
                ? Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'card',
                      style: TextStyle(
                          color: widget.isSelected == true
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : SizedBox(),
            widget.isSvg == false
                ? Image.asset(
                    'res/assets/${widget.image}',
                    height: 30.h,
                    color:
                        widget.isSelected == true ? Colors.white : Colors.black,
                  )
                : SvgPicture.asset(
                    'res/assets/${widget.image}',
                    color:
                        widget.isSelected == true ? Colors.white : Colors.black,
                  ),
          ],
        ),
      ),
    );
  }
}

