import 'package:wasq/features/home/data/models/home_response.dart';
import 'package:wasq/features/invoice/ui/invoice_screen.dart';
import 'package:wasq/features/orders/data/model/order_response.dart';
import 'package:wasq/features/orders/ui/order_details_screen.dart';
import 'package:wasq/features/orders/ui/rates_preview_screen.dart';
import 'package:wasq/features/service_form/ui/project_uploaded_page.dart';
import 'package:flutter/material.dart';
import '../features/auth/ui/auth_screen.dart';
import '../features/auth/ui/login_screen.dart';
import '../features/auth/ui/signup_screen.dart';
import '../features/auth/ui/verify_otp_screen.dart';
import '../features/chat/ui/chat_screen.dart';
import '../features/chat/ui/trackingPage.dart';
import '../features/home/ui/home_screen.dart';
import '../features/home/ui/navigation_screen.dart';
import '../features/orders/ui/choose_proposal_screen.dart';
import '../features/orders/ui/request_screen.dart';
import '../features/service_form/ui/map.dart';
import '../features/service_form/ui/service_form_screen.dart';

class Routes {
  static const String initRoute = "/";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String verifyOtpScreen = "/verify_otp";
  static const String homeScreen = "/home";
  static const String navigationScreen = "/navigation";
  static const String forgetPasswordScreen = "/forget_password";
  static const String serviceFormScreen = "/service_form";
  static const String locationAccess = "/LocationAccess";
  static const String projectUploaded = "/project_uploaded";
  static const String requestServiceScreen = "/request_service";
  static const String chat = "/chat";
  static const String trackingScreen = "/trackingScreen";
  static const String ratesPreview = "/ratesPreview";
  static const String invoice = "/invoice";
  static const String showInvoice = "/show_invoice";
  static const String order_details = "/order_details";
  static const String attachments = "/attachments";
  static const String chooseProposalScreen = "/chooseProposalScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case chooseProposalScreen:
        var data = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => ChooseProposalScreen(
                  projectId: data,
                ));
      case verifyOtpScreen:
        var data = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => VerifyOtpScreen(
                  phoneNumber: data["phone"] as String,
                  temp_user_id: data["temp_user_id"] as int,
                ));
      // case forgetPasswordScreen:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case navigationScreen:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
      case chat:
        var data = settings.arguments as Proposals;
        return MaterialPageRoute(
            builder: (_) => Chat(
                  proposal: data,
                ));
      case locationAccess:
        var data = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => LocationAccess(isPreview: data));
      case trackingScreen:
        var data = settings.arguments as Proposals;
        return MaterialPageRoute(
            builder: (_) => TrackingMap(
                  proposal: data,
                ));
      case requestServiceScreen:
        var data = settings.arguments as Proposals;
        return MaterialPageRoute(
            builder: (_) => RequestService(
                  proposal: data,
                ));
      case serviceFormScreen:
        var data = settings.arguments as Service;
        return MaterialPageRoute(
            builder: (_) => ServiceFormScreen(
                  service: data,
                ));
      case projectUploaded:
        var data = settings.arguments as Project;
        return MaterialPageRoute(
            builder: (_) => ProjectUploadedPage(
                  project: data,
                ));
      case ratesPreview:
        var data = settings.arguments as Providers;
        return MaterialPageRoute(
            builder: (_) => RatesPreview(
                  provider: data,
                ));
      case invoice:
        var data = settings.arguments as Proposals;
        return MaterialPageRoute(
            builder: (_) => InvoiceScreen(
                  proposals: data,
                ));

      // case showInvoice:
      //   var data = settings.arguments as Proposals;
      //   return MaterialPageRoute(
      //       builder: (_) => ShowInvoiceScreen(
      //             proposals: data,
      //           ));
      // case attachments:
      //   var data = settings.arguments as Project;
      //   return MaterialPageRoute(builder: (_) => AttachmetsScreen(project: data,));
      case order_details:
        var data = settings.arguments as Proposals;
        return MaterialPageRoute(builder: (_) => OrderDetails(proposal: data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static Widget buildPage(RouteSettings settings) {
    switch (settings.name) {
      default:
        return const SizedBox.shrink();
    }
  }
}
