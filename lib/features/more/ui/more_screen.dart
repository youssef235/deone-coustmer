import 'dart:developer';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasq/features/more/data/model/settings.dart';
import 'package:wasq/features/more/data/provider/settings_provider.dart';
import 'package:wasq/features/more/ui/profile.dart';
import 'package:wasq/features/more/ui/terms_conditions.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/widgets/text_field.dart';
import '../../../theme/app_assets.dart';
import '../../../utils/utils.dart';
import '../../auth/data/providers/auth_provider.dart';
import '../../home/data/providers/home_provider.dart';
import 'package:share_plus/share_plus.dart';

// import 'package:flutter_share/flutter_share.dart';

class MoreScreen extends StatefulHookConsumerWidget {
  const MoreScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MoreScreen>
    with AutomaticKeepAliveClientMixin {
  // Settings? settings;

  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      // settings = ref.watch(settingsNotifierProvider).settingsResponse;
      ref.read(settingsNotifierProvider.notifier).getSettings();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Button> buttons = [
      // Button(
      //     name: "حسابي",
      //     iconData: Icons.person,
      //     pressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const ProfilePage()));
      //     }),
      // Button(
      //     name: "التنبيهات",
      //     iconData: Icons.notifications,
      //     pressed: () {
      //       ref.read(homeNotifierProvider.notifier).changePageIndex(2);
      //       // Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationsScreen()));
      //     }),
      // Button(
      //     name: "الطلبات",
      //     iconData: Icons.list,
      //     pressed: () {
      //       ref.read(homeNotifierProvider.notifier).changePageIndex(1);
      //       // Navigator.push(context, MaterialPageRoute(builder: (context)=> OrdersScreen()));
      //     }),
      // Button(
      //     name: "سياساتنا",
      //     iconData: Icons.policy,
      //     pressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => TermsConditionsPage()));
      //     }),
      // Button(
      //     name: "مشاركة التطبيق",
      //     iconData: Icons.share,
      //     pressed: () async {
      //       // Set the app link and the message to be shared
      //       final String appLink =
      //           'https://play.google.com/store/apps/details?id=com.wasq';
      //       final String message = 'تطبيق الديـ ون: $appLink';

      //       // Share the app link and message using the share dialog
      //       await FlutterShare.share(
      //           title: 'مشاركة التطبيق', text: message, linkUrl: appLink);
      //     }),
      // Button(
      //     name: "تسجيل الخروج",
      //     iconData: Icons.logout,
      //     pressed: () {
      //       ref.read(homeNotifierProvider.notifier).changePageIndex(0);
      //       ref.read(authNotifierProvider.notifier).logout();
      //     }),
      // Button(
      //     name: "الدعم الفني",
      //     iconData: Icons.support_agent,
      //     pressed: () {
      //       whatsapp(int.parse(settings?.whatsappNumber ?? "+201017238583"));
      //     }),
      // Button(
      //     name: "حذف الحساب",
      //     iconData: Icons.delete,
      //     pressed: () {
      //       ref.read(homeNotifierProvider.notifier).changePageIndex(0);
      //       ref.read(authNotifierProvider.notifier).logout();
      //     }),
    ];
    super.build(context);
    final auth = ref.watch(authNotifierProvider);

    return SafeArea(
      child: Scaffold(
          body: ref.watch(settingsNotifierProvider).loading
              ? Container(
                  child: const Center(child: CircularProgressIndicator()),
                )
              : Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.recLogo,
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15),
                          Expanded(
                            child: Container(
                              // width: MediaQuery.of(context).size.width * 0.75,
                              // height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: AppColors.blackGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "الاعدادات",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // Expanded(
                      //   child: GridView.builder(
                      //       itemCount: buttons.length,
                      //       gridDelegate:
                      //           const SliverGridDelegateWithFixedCrossAxisCount(
                      //               crossAxisSpacing: 10,
                      //               mainAxisSpacing: 10,
                      //               childAspectRatio: 1 / .5,
                      //               crossAxisCount: 2),
                      //       itemBuilder: (_, index) {
                      //         return InkWell(
                      //           onTap: buttons[index].pressed,
                      //           child: Container(
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: AppColors.blackGrey,
                      //               ),
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Text(buttons[index].name,
                      //                       style: const TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 14)),
                      //                   const SizedBox(width: 10),
                      //                   Icon(
                      //                     buttons[index].iconData,
                      //                     color: Colors.white,
                      //                     size: 28,
                      //                   ),
                      //                 ],
                      //               )),
                      //         );
                      //       }),
                      // ),

                      Expanded(
                          child: ListView(children: [
                        SettingsItem(
                          image: 'myOrders.svg',
                          text: 'طلباتي',
                          onTap: () {
                            ref
                                .read(homeNotifierProvider.notifier)
                                .changePageIndex(1);
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SettingsItem(
                          image: 'logOut.svg',
                          icon: const Icon(
                            Icons.person,
                            color: Color(0xff707070),
                          ),
                          text: 'حسابي',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()));
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // SettingsItem(
                        //   image: 'repeatedQuestions.svg',
                        //   text: 'اسأله مكرره',
                        //   onTap: () {},
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        SettingsItem(
                          image: 'callCenter.svg',
                          text: 'خدمة العملاء',
                          onTap: () {
                            log((ref
                                    .watch(settingsNotifierProvider)
                                    .settingsResponse
                                    ?.whatsappNumber
                                    ?.toString())
                                .toString());
                            whatsapp(ref
                                    .watch(settingsNotifierProvider)
                                    .settingsResponse
                                    ?.whatsappNumber ??
                                "+966552379982");
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SettingsItem(
                          image: 'tems.svg',
                          text: 'الشروط والاحكام',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TermsConditionsPage()));
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // SettingsItem(
                        //   image: 'sugeestions.svg',
                        //   text: 'الشكاوي والمقترحات',
                        //   onTap: () {},
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        SettingsItem(
                          image: 'share_app.svg',
                          text: 'مشاركة التطبيق',
                          onTap: () async {
                            // Set the app link and the message to be shared
                            String appLink = '';

                            String message = 'تطبيق الديـ ون: $appLink';

                            if (Platform.isAndroid) {
                              appLink =
                                  'https://play.google.com/store/apps/details?id=com.diesel.customer';
                              message = 'تطبيق الديـ ون: $appLink';
                            } else {
                              appLink =
                                  'https://apps.apple.com/us/app/%D8%AF%D9%8A%D9%80-%D9%88%D9%86/id6478897611';
                            }
                            // Share the app link and message using the share dialog
                            // await FlutterShare.share(
                            //     title: 'مشاركة التطبيق',
                            //     text: message,
                            //     linkUrl: appLink);
                            await Share.share(message);

                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SettingsItem(
                          image: 'logOut.svg',
                          text: 'تسجيل الخروج',
                          onTap: () {
                            ref
                                .read(homeNotifierProvider.notifier)
                                .changePageIndex(0);
                            ref.read(authNotifierProvider.notifier).logout();
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SettingsItem(
                          image: 'logOut.svg',
                          icon: const Icon(
                            Icons.delete,
                            color: Color(0xff707070),
                          ),
                          text: 'حذف الحساب',
                          onTap: () {
                            ref
                                .read(homeNotifierProvider.notifier)
                                .changePageIndex(0);
                            ref.read(authNotifierProvider.notifier).logout();
                          },
                        ),
                      ])),
                    ],
                  ),
                )),
    );
  }

  Future<String?> updateNameDialog(
    BuildContext context,
  ) async {
    TextEditingController _userNameController = TextEditingController();
    _userNameController.text = ref.read(authNotifierProvider).user?.name ?? "";
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            child: AlertDialog(
              title: const Text('تغير الاسم'),
              content: Form(
                key: _formKey,
                child: AppTextField(
                  textDirection: TextDirection.rtl,
                  controller: _userNameController,
                  hintText: 'الإسم بالكامل',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لا يمكنك ترق حقل الإسم فارغا';
                    }

                    return null;
                  },
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff7C7C7C)),
                  suffixIcon: Image.asset(AppAssets.profileIcon),
                  color: Colors.transparent,
                ),
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    child: const Text('تعديل الاسم'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_userNameController.text ==
                            ref.read(authNotifierProvider).user?.name) {
                          Navigator.pop(context);
                          return;
                        }
                        await ref
                            .read(authNotifierProvider.notifier)
                            .updateUser(name: _userNameController.text)
                            .then((value) {
                          if (value == true) {
                            Navigator.pop(context);
                            AppSnackbar.show(buildSnackBar(
                                text: "تم تعديل الاسم بنجاح",
                                backgroundColor: Colors.green));
                          } else {
                            AppSnackbar.show(buildSnackBar(
                                text: "حدث خطأ ما",
                                backgroundColor: Colors.red));
                          }
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<String?> updatePhoneDialog(
    BuildContext context,
  ) async {
    TextEditingController mobileController = TextEditingController();
    mobileController.text = ref.read(authNotifierProvider).user?.phone ?? "";
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            child: AlertDialog(
              title: const Text('تغير رقم الجوال'),
              content: Form(
                key: formKey,
                child: AppTextField(
                  controller: mobileController,
                  textInputType: TextInputType.phone,
                  hintText: 'رقم الجوال',
                  validator: (value) {
                    if (value == null) {
                      return 'من فضلك ادخل رقم هاتف صحيح';
                    }
                    if (value.isEmpty || value.length < 9) {
                      return 'من فضلك ادخل رقم هاتف صحيح';
                    }
                    return null;
                  },
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff7C7C7C),
                  ),
                  suffixIcon: Image.asset(
                    AppAssets.saFlag,
                    width: 15,
                  ),
                  color: Colors.transparent,
                  // controller: _phoneTextController,
                ),
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    child: const Text('تعديل رقم الجوال'),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (mobileController.text ==
                            ref.read(authNotifierProvider).user?.name) {
                          Navigator.pop(context);
                          return;
                        }
                        await ref
                            .read(authNotifierProvider.notifier)
                            .updateUser(phone: mobileController.text)
                            .then((value) {
                          if (value == true) {
                            Navigator.pop(context);
                            AppSnackbar.show(buildSnackBar(
                                text: "تم تعديل الاسم بنجاح",
                                backgroundColor: Colors.green));
                          } else {
                            AppSnackbar.show(buildSnackBar(
                                text: "حدث خطأ ما",
                                backgroundColor: Colors.red));
                          }
                        });
                        // if(result!=null&&result.toString().isNotEmpty){
                        //   AppSnackbar.show(buildSnackBar(text: result.toString(),backgroundColor: Colors.green));
                        //   _textFieldController.clear();
                        //   Navigator.pushNamedAndRemoveUntil(context, Routes.initRoute, (route) => false);
                        // }
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<String?> _showTextInputDialog(
    BuildContext context,
  ) async {
    return showDialog(
        context: context,
        builder: (context) {
          TextEditingController _textFieldController = TextEditingController();
          GlobalKey<FormState> _formKey = GlobalKey<FormState>();
          return Container(
            width: double.infinity,
            child: AlertDialog(
              title: const Text('شكوي او اقتراح'),
              content: Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
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
                            return 'من فضلك اكتب هنا';
                          }
                          return null;
                        },
                        maxLines: null, // Allow multiple lines for notes
                        decoration: const InputDecoration(
                          hintText: 'من فضلك اكتب هنا',
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
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    child: const Text('تقديم'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        AppSnackbar.show(buildSnackBar(
                            text: "تم الارسال", backgroundColor: Colors.green));
                        Navigator.pop(context);
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
  bool get wantKeepAlive => true;
}

class SettingsItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  final Widget? icon;

  const SettingsItem({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 428.w,
        decoration: const BoxDecoration(
          color: Color(0xffF6F6F6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              icon == null ? SvgPicture.asset('res/assets/$image') : icon!,
            ],
          ),
        ),
      ),
    );
  }
}

class Button {
  String name;
  IconData iconData;
  Function() pressed;
  Button({required this.name, required this.pressed, required this.iconData});
}

whatsapp(String number) async {
  var androidUrl = "whatsapp://send?phone=$number&text=Hi, I need some help";
  var iosUrl =
      "https://wa.me/$number?text=${Uri.parse('Hi, I need some help')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    AppSnackbar.show(buildSnackBar(
        text: "تطبيق الواتس اب غير مثبت", backgroundColor: Colors.red));
  }
}
