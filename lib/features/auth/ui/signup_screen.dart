import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/app_keys.dart';
import '../../../app/routes.dart';
import '../../../app/widgets/text_field.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/auth_provider.dart';

class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider);
    ref.listen(authNotifierProvider.select((value) => value.errorMessage),
        (previous, nextErrorMessage) {
      if (nextErrorMessage != null && nextErrorMessage != '') {
        AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
        Future.delayed(Duration(seconds: 3), () {
          ref.read(authNotifierProvider.notifier).resetErrorMessage();
        });
      }
    });
    return Scaffold(
      // backgroundColor: AppColors.primaryColor, // Set the background color
      key: AppKeys.registerScaffoldKey,
      body: Form(
        key: AppKeys.registerFormKey,
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'res/assets/Login.png',
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(27.r)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image.asset(
                              //   AppAssets.recLogo,
                              //   width: MediaQuery.of(context).size.width * 0.25,
                              // ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              const Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'لديك حساب بالفعل؟',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'تسجيل دخول!',
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              AppTextField(
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),

                              AppTextField(
                                controller: _emailController,
                                hintText: 'البريد الإلكتروني',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'لا يمكنك ترق حقل البريد الالكتروني فارغا';
                                  }
                                  if (value.contains(" "))
                                    value = value.replaceAll(" ", "");
                                  RegExp emailRegExp = RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                                  if (!emailRegExp.hasMatch(value)) {
                                    return 'البريد الإلكتروني غير صالح';
                                  }
                                  return null;
                                },
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff7C7C7C)),
                                suffixIcon: Image.asset(AppAssets.mailIcon),
                                color: Colors.transparent,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              AppTextField(
                                controller: _mobileController,
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              // Add your login button here
                              auth.loading
                                  ? Container(
                                      child: Center(
                                          child:
                                              const CircularProgressIndicator(
                                      color: AppColors.black,
                                    )))
                                  : Center(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.893,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.068,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF32343D),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextButton(
                                          onPressed: () async {
                                            if (AppKeys
                                                .registerFormKey.currentState!
                                                .validate()) {
                                              int result = await ref
                                                  .read(authNotifierProvider
                                                      .notifier)
                                                  .register(
                                                    username:
                                                        _userNameController
                                                            .text,
                                                    email:
                                                        _emailController.text,
                                                    mobile:
                                                        _mobileController.text,
                                                  );
                                              if (result != -1) {
                                                final currentContext =
                                                    context; // Capture the context
                                                Navigator.pushNamed(
                                                    currentContext,
                                                    Routes.verifyOtpScreen,
                                                    arguments: {
                                                      'phone': _mobileController
                                                          .text,
                                                      'temp_user_id': result
                                                    });
                                              }
                                            }
                                          },
                                          child: const Text(
                                            'دخول',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
