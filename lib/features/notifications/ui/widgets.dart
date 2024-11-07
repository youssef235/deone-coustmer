import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../utils/utils.dart';
import '../../orders/data/model/order_response.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../orders/data/providers/order_provider.dart';

class Rate extends StatefulHookConsumerWidget {
  final Proposals proposal;

  @override
  const Rate({Key? key, required this.proposal}) : super(key: key);

  @override
  ConsumerState<Rate> createState() => _RateState();
}

class _RateState extends ConsumerState<Rate> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(orderNotifierProvider.notifier).getAddressFromCoordinates(
        widget.proposal.project?.location_lat ?? 0,
        widget.proposal.project?.location_lang ?? 0,);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      submitButtonTextStyle: const TextStyle(color: AppColors.primaryColor),
      initialRating: 1.0,
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
      image: Center(child: Text("تم الدفع بنجاح")),
      submitButtonText: 'ارسال',

      commentHint: 'التعليق',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) async {
        var result = await ref
            .read(orderNotifierProvider.notifier)
            .rateProvider(
                widget.proposal.project?.id ?? 0,
                widget.proposal.provider?.id ?? 0,
                response.rating.toInt(),
                response.comment);
        if (result != null) {
          AppSnackbar.show(buildSnackBar(
              text: "تم تقيم الفني بنجاح", backgroundColor: Colors.green));
        }
      },
    );
  }
}
