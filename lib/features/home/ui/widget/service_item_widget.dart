import 'package:cached_network_image/cached_network_image.dart';
import 'package:wasq/features/home/data/models/home_response.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/routes.dart';
import '../../../../theme/app_assets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/hive_manager.dart';

class ServiceItem extends StatelessWidget {
  final Service service;

  const ServiceItem(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (HiveManager.getData(StorageKeys.tokenKey) == null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("سجل دخولك"),
                content: const Text("للوصول لهذه الميزه يجب عليك تسجل الدخول"),
                actions: <Widget>[
                  MaterialButton(
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          color: AppColors.primaryColor, letterSpacing: 0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Closes the dialog
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.loginScreen,
                        (route) => false,
                      ); // Redirect to login screen
                    },
                  ),
                ],
              );
            },
          );
        } else {
          Navigator.pushNamed(context, Routes.serviceFormScreen,
              arguments: service);
        }
      },
      child: Container(
        height: 196.h,
        width: 196.h,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 0.5, spreadRadius: 10.5, offset: Offset(0, .5))
          // ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1,
            color: Color(0xffD8D8D8),
          ),
        ),
        //  elevation: 0,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          // const Positioned(
          //     child: Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Icon(
          //           Icons.add_circle,
          //           color: AppColors.primaryColor,
          //         ))),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  height: 60.h,
                  width: 60.h,
                  fit: BoxFit.cover,
                  imageUrl: "${service?.icon?.url}",
                  placeholder: (context, url) =>
                      Image.asset(AppAssets.recLogo, fit: BoxFit.cover),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppAssets.recLogo, fit: BoxFit.cover),
                ),
                // Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    service.name ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
