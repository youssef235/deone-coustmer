import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasq/features/orders/ui/orders_screen.dart';
import 'package:wasq/theme/app_assets.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Notifications/ui/notifications_screen.dart';
import '../../more/ui/more_screen.dart';
import '../../work/ui/more_screen.dart';
import '../data/providers/home_provider.dart';
import 'home_screen.dart';

class NavigationScreen extends StatefulHookConsumerWidget {
  const NavigationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _children = [
    const HomeScreen(),
    const OrdersScreen(),
    const NotificationsScreen(),
    const MoreScreen()
  ];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final homeProvider = ref.watch(homeNotifierProvider);

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 10, // Blur radius
              offset: Offset(0, 3), // Offset from top
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
              unselectedLabelStyle: TextStyle(color: Colors.black),
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed, // Disable animation

              currentIndex: homeProvider.screenIndex,
              onTap: onTabTapped,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                        ref.read(homeNotifierProvider).screenIndex == 0
                            ? 'res/assets/homeIcon.svg'
                            : "res/assets/homeIocnDeactiviated.svg"),
                    //  icon: ColorFiltered(
                    //     colorFilter: ColorFilter.mode(
                    //       ref.read(homeNotifierProvider).screenIndex == 0
                    //           ? AppColors.primaryColor
                    //           : AppColors.grayWhite,
                    //       BlendMode.srcIn,
                    //     ),
                    //     child:Icon(Icons.home_outlined)

                    //     //  Image.asset(
                    //     //   AppAssets.homeIcon,
                    //     //   width: 26, // Specify the width
                    //      //   height: 26, // Specify the height
                    //     // ),
                    //   ),
                    label: "الرئيسية"),
                BottomNavigationBarItem(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        ref.read(homeNotifierProvider).screenIndex == 1
                            ? AppColors.primaryColor
                            : AppColors.grayWhite,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('res/assets/orders.svg'),
                    ),
                    label: "الطلبات"),
                BottomNavigationBarItem(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        ref.read(homeNotifierProvider).screenIndex == 2
                            ? AppColors.primaryColor
                            : AppColors.grayWhite,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('res/assets/bill.svg'),
                    ),
                    label: "التنبيهات"),
                BottomNavigationBarItem(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        ref.read(homeNotifierProvider).screenIndex == 3
                            ? AppColors.primaryColor
                            : AppColors.grayWhite,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('res/assets/settings.svg'),
                    ),
                    label: "الاعدادات"),
              ]),
        ),
      ),
      body: _children[homeProvider.screenIndex],
    );
  }

  void onTabTapped(int index) {
    ref.read(homeNotifierProvider.notifier).changePageIndex(index);
  }

  @override
  bool get wantKeepAlive => true;
}
