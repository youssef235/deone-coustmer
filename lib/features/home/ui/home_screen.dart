import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:wasq/features/home/data/models/home_response.dart';
import 'package:wasq/features/home/ui/widget/service_item_widget.dart';
import 'package:wasq/theme/app_assets.dart';
import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../app/widgets/animation/shimmer/shimmer_loading_anim.dart';
import '../../../theme/app_text_style.dart';
import '../data/providers/home_provider.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  int isSelected = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(homeNotifierProvider.notifier).getMainServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.watch(homeNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.grayBackground2,
      body: SafeArea(
        child: homeProvider.mainServiceLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        )
            : DefaultTabController(
          length: homeProvider.mainServices?.length ?? 0,
          child: Column(
            children: [
              const SizedBox(height: 40),
              TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelColor: AppColors.primaryColor,
                indicatorColor: Colors.transparent,
                labelPadding: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                onTap: (value) {
                  setState(() {
                    isSelected = value;
                  });
                },
                tabs: homeProvider.mainServices?.asMap().entries.map((entry) {
                  final index = entry.key;
                  final mainService = entry.value;
                  final isSelectedTab = isSelected == index;

                  // تحديد الصورة الافتراضية لكل خدمة حسب الترتيب
                  String defaultImagePath;
                  if (index == 0) {
                    defaultImagePath = 'res/assets/sath_trans.png';
                  } else if (index == 1) {
                    defaultImagePath = 'res/assets/car_wash.png';
                  } else if (index == 2) {
                    defaultImagePath = 'res/assets/soon.png';
                  } else {
                    defaultImagePath = 'res/assets/soon.png'; // صورة افتراضية لأي خدمة أخرى
                  }

                  return Container(
                    width: 132,
                    height: 59,
                    decoration: BoxDecoration(
                      color: isSelectedTab ? AppColors.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            mainService.icon?.url ?? '',
                            width: 27,
                            height: 27,
                            errorBuilder: (context, error, stackTrace) {
                              // الصورة البديلة بناءً على الترتيب
                              return Image.asset(
                                defaultImagePath,
                                width: 27,
                                height: 27,
                              );
                            },
                          ),
                          Text(
                            mainService.name ?? '',
                            style: TextStyle(
                              color: isSelectedTab ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList() ?? [],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: homeProvider.mainServices?.map((mainService) {
                    return SubServiceGridView(mainService.id!);
                  }).toList() ??
                      [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubServiceGridView extends StatefulHookConsumerWidget {
  const SubServiceGridView(this.parentId, {super.key});

  final int parentId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubServiceGridViewState();
}

class _SubServiceGridViewState extends ConsumerState<SubServiceGridView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      try {
        await ref.read(homeNotifierProvider.notifier).getSubServices(widget.parentId);
      } catch (e) {
        print("Error fetching sub services: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.watch(homeNotifierProvider);
    return homeProvider.subServiceLoading
        ? ShimmerLoadingAnim(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Card(
            elevation: 4,
          );
        },
      ),
    )
        : homeProvider.subServices?.isNotEmpty == true
        ? GridView.builder(
      itemCount: homeProvider.subServices!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ServiceItem(homeProvider.subServices![index]);
      },
    )
        : const Center(
      child: Text("لا يوجد خدمات فرعيه"),
    );
  }
}