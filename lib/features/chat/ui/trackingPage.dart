import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasq/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../orders/data/model/order_response.dart';
import '../data/providers/chat_provider.dart';

class TrackingMap extends StatefulHookConsumerWidget {
  const TrackingMap({super.key, required this.proposal});
  final Proposals proposal;

  @override
  ConsumerState<TrackingMap> createState() => _TrackingMapState();
}

class _TrackingMapState extends ConsumerState<TrackingMap> {
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        AppAssets.car, // Replace with your image path
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تتبع الفني"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: StreamBuilder(
        stream: ref
            .watch(chatNotifierProvider.notifier)
            .getLiveLocation(widget.proposal.provider?.id ?? 0),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('حدث خطأ ما'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data?.data() == null) {
            return const Center(
              child: Text('لا يوجد بيانات تتبع لهذا الفني'),
            );
          }
          var data = snapshot.data?.data() as Map<String, dynamic>;
          return GoogleMap(
            markers: {
              Marker(
                markerId: MarkerId("1"),
                position: LatLng(
                  widget.proposal.project?.location_lat ?? 0,
                  widget.proposal.project?.location_lang ?? 0,
                ),
              ),
              Marker(
                markerId: MarkerId("2"),
                position: LatLng(data["lat"] ?? 0, data["long"] ?? 0),
                icon: customIcon,
              )
            },
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(data["lat"] ?? 0, data["long"] ?? 0),
              zoom: 15,
            ),
          );
        },
      ),
    );
  }
}
