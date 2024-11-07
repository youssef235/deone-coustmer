import 'package:cached_network_image/cached_network_image.dart';
import 'package:wasq/features/orders/data/providers/order_provider.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:wasq/theme/app_assets.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RatesPreview extends StatefulHookConsumerWidget {
  Providers provider;
  RatesPreview({required this.provider, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RatesPreviewState();
}

class _RatesPreviewState extends ConsumerState<RatesPreview> {
  List<Review> reviews = [];
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      reviews = await ref
          .read(orderNotifierProvider.notifier)
          .getReviews(widget.provider.id!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تقييمات الفني"),
      ),
      body: ref.watch(orderNotifierProvider).loading
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
          : reviews.isEmpty
              ? const Center(
                  child: Text('لا يوجد تقييات'),
                )
              : Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
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
                            imageUrl: widget.provider?.avatar ?? "",
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
                        SizedBox(
                          height: 10,
                        ),
                        blackLabel([
                          Text(
                            widget.provider.name!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        blackLabel([
                          Text(
                            widget.provider.avg_rate.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.star_half,
                            color: Colors.white,
                          ),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: reviews.length,
                            itemBuilder: (_, index) => rateRow(
                                reviews[index].avatar ?? "",
                                reviews[index].rate.toString(),
                                reviews[index].review!),
                          ),
                        ),
                      ]),
                ),
    );
  }
}

Widget blackLabel(List<Widget> props) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: AppColors.blackGrey, borderRadius: BorderRadius.circular(10)),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: props),
  );
}

Widget rateRow(String avatar, String rate, String comment) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40, // Adjust the width as needed
          height: 40, // Adjust the height as needed
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Image.asset(AppAssets.avatar, fit: BoxFit.fitWidth),
        ),
        Container(
          width: 300,
          child: blackLabel([
            Text(
                comment.length > 15
                    ? comment.substring(0, 15) + '...'
                    : comment,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(
              width: 10,
            ),
            Text(rate,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            Icon(
              Icons.star_half,
              color: Colors.white,
            )
          ]),
        )
      ],
    ),
  );
}
