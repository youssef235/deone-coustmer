import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import '../data/model/order_response.dart';

class MapScreenWidget extends StatefulWidget {
  final Order? order;

  const MapScreenWidget({super.key, required this.order});

  @override
  _MapScreenWidgetState createState() => _MapScreenWidgetState();
}

class _MapScreenWidgetState extends State<MapScreenWidget> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  Position? _currentPosition;

  Future<void> _getCurrentLocation() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      position = await Geolocator.getLastKnownPosition();
    }

    setState(() {
      _currentPosition = position;
    });
  }

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  CameraPosition? _kGooglePlex;
  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    // _markers.add(Marker(
    //   markerId: MarkerId('point1'),
    //   position: point1,
    //   icon: BitmapDescriptor.defaultMarker,
    // ));

//   _markers.add(Marker(
//   markerId: MarkerId('point2'),
//   position: point2,
//   icon: BitmapDescriptor.fromBytes((await getBytesFromAsset('assets/mog.png')).buffer.asUint8List()),
// ));

    return SafeArea(
        child: GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          double.tryParse(widget.order?.provider?.location_lat ?? "0") ?? 0,
          double.tryParse(widget.order?.provider?.location_lang ?? "0") ?? 0,
        ),
        zoom: 15.0,
      ),
      markers: _markers,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
      polylines: _polylines,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        //  _addPolyline();
        addMarkers();
      },
    ));
  }

  void _addPolyline() {
    List<LatLng> polylineCoordinates = [
      LatLng(
        double.tryParse(widget.order?.provider?.location_lat ?? "0") ?? 0,
        double.tryParse(widget.order?.provider?.location_lang ?? "0") ?? 0,
      ),
    ];

    _polylines.add(Polyline(
      polylineId: PolylineId('line'),
      points: polylineCoordinates,
      color: Colors.blue,
      width: 5,
    ));
    setState(() {});
  }

  Future<ByteData> getBytesFromAsset(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data;
  }

  Future<void> addMarkers() async {
    _markers.add(Marker(
      markerId: MarkerId('point2'),
      position: LatLng(
        double.tryParse(widget.order?.provider?.location_lat ?? "0") ?? 0,
        double.tryParse(widget.order?.provider?.location_lang ?? "0") ?? 0,
      ),
      icon: BitmapDescriptor.fromBytes(
          (await getBytesFromAssets('res/assets/marker.png', 150))
              .buffer
              .asUint8List()),
    ));

    // _markers.add(Marker(
    //   markerId: MarkerId('point1'),
    //   position: LatLng(
    //     double.parse(widget.order.destination!.destinationLat!),
    //     double.parse(widget.order.destination!.destinationLng!),
    //   ),
    //   icon: BitmapDescriptor.fromBytes(
    //     (await getBytesFromAssets('assets/images/small_box.png', 100))
    //         .buffer
    //         .asUint8List(),
    //     // size: Size(1000, 1000),
    //   ),
    // ));
    setState(() {});
  }

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
