import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wasq/app/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';

import '../../utils/utils.dart';
import '../notifications/ui/widgets.dart';

class PaymentWebView extends StatefulHookConsumerWidget {
  final Proposals proposals;
  final String url;
  const PaymentWebView({
    super.key,
    required this.proposals,
    required this.url,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends ConsumerState<PaymentWebView> {
  late WebViewController webViewController;
  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            print("->>>>>>>>>> ${request.url}");
            if (request.url.contains('status=paid')) {
              Navigator.popAndPushNamed(context, Routes.initRoute);
              await onPaymentSuccess();

              return NavigationDecision.prevent;
            } else if (request.url.contains('status=unpaid')) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
                  text: 'فشلت عمليه الدفع', backgroundColor: Colors.red));

              return NavigationDecision.navigate;
            } else {
              return NavigationDecision.navigate;


            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

  }

  onPaymentSuccess() async {
    ScaffoldMessenger.of(context).showSnackBar(
        buildSnackBar(text: 'تم الدفع بنجاح', backgroundColor: Colors.green));

    showDialog(
      context: context,
      builder: (context) => Rate(proposal: widget.proposals),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(
          controller: webViewController,
        ),
      ),
    );
  }
}
