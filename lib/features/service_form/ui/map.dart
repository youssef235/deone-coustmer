import 'dart:async';

// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasq/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as places;
import 'package:flutter_google_places/flutter_google_places.dart' as loc;
import 'package:google_api_headers/google_api_headers.dart' as header;
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/service_form_provider.dart';

class LocationAccess extends StatefulWidget {
  final bool? isPreview;
  final bool? isDestinationLocation;
  final WidgetRef? widgetRef;
  const LocationAccess(
      {super.key, this.isPreview, this.isDestinationLocation, this.widgetRef});

  @override
  State<LocationAccess> createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  late bool? justPreview;
  double latitude = 0;
  double longitude = 0;
  GoogleMapController? _controller;
  late Position currentLocation;
  CameraPosition? _kGooglePlex;
  Set<Marker> marker = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(0, 0),
    )
  };
  Future<void> getPos() async {
    currentLocation =
        await Geolocator.getCurrentPosition().then((value) => value);

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;

    marker = {
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(latitude, longitude),
      )
    };
    _kGooglePlex = CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: 20,
    );
    setState(() {});
  }

  Future<bool> getPer() async {
    LocationPermission per;
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      bool userAgreed = await showDisclosureDialog(context);
      if (userAgreed) {
        // User agreed to the disclosure, proceed to request location permission
        per = await Geolocator.requestPermission();
      } else {
        // User disagreed to the disclosure, handle accordingly
        AppSnackbar.show(buildSnackBar(
            text: "لتجربة أفضل من فضلك اعطي التطبيق صلاحيات الموقع"));
        return false;
      }
      if (per == LocationPermission.whileInUse ||
          per == LocationPermission.always ||
          per == LocationPermission.unableToDetermine) {
        getPos();
      } else {
        AppSnackbar.show(buildSnackBar(
            text: "لتجربة أفضل من فضلك اعطي التطبيق صلاحيات الموقع"));

        latitude = 24.774265;
        longitude = 46.738586;

        marker = {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(latitude, longitude),
          )
        };
        _kGooglePlex = CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 11,
        );
        setState(() {});
      }
    } else {
      getPos();
    }

    return per == LocationPermission.whileInUse;
  }

  @override
  void initState() {
    getPer();
    super.initState();
  }

  Future<void> _handleSearch() async {
    places.Prediction? p = await loc.PlacesAutocomplete.show(
        context: context,
        apiKey: 'AIzaSyBUrCrWXoJIy5_yHzlkzHkXp8zRcxQoSsI',
        onError: onError, // call the onError function below
        mode: loc.Mode.overlay,
        language: 'ar', //you can set any language for search
        strictbounds: false,
        types: [],
        overlayBorderRadius: BorderRadius.circular(20),
        decoration: InputDecoration(
            hintText: 'البحث',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white),
            )),
        components: [] // you can determine search for just one country
        );

    displayPrediction(
      p!,
    );
  }

  void onError(places.PlacesAutocompleteResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
        buildSnackBar(text: response.errorMessage ?? "حدث حطأ ما"));
  }

  Future<void> displayPrediction(
    places.Prediction p,
  ) async {
    places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(
        apiKey: 'AIzaSyBUrCrWXoJIy5_yHzlkzHkXp8zRcxQoSsI',
        apiHeaders: await const header.GoogleApiHeaders().getHeaders());
    places.PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId!);
// detail will get place details that user chose from Prediction search
    latitude = detail.result.geometry!.location.lat;
    longitude = detail.result.geometry!.location.lng;
    print("lat : $latitude");
    print("lng : $longitude");
    setState(() {
      marker = {
        Marker(
          markerId: const MarkerId("1"),
          position: LatLng(latitude, longitude),
        )
      };
      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(latitude, longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isPreview == true
            ? const Text(" موقعك الحالي")
            : const Text("اختر موقعك"),
        centerTitle: true,
      ),
      body: _kGooglePlex == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GoogleMap(
                    markers: marker,
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex!,
                    gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(
                          () => PanGestureRecognizer()))
                      ..add(Factory<ScaleGestureRecognizer>(
                          () => ScaleGestureRecognizer()))
                      ..add(Factory<TapGestureRecognizer>(
                          () => TapGestureRecognizer()))
                      ..add(Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
                    onCameraMove: (CameraPosition position) {
                      if (widget.isPreview == true) return;
                      _kGooglePlex = position;
                      setState(() {
                        latitude = _kGooglePlex!.target.latitude;
                        longitude = _kGooglePlex!.target.longitude;
                        marker = {
                          Marker(
                            markerId: const MarkerId("1"),
                            position: LatLng(_kGooglePlex!.target.latitude,
                                _kGooglePlex!.target.longitude),
                          )
                        };
                      });
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top:
                      10, // you can change place of search bar any where on the map
                  child: InkWell(
                    onTap: () {
                      _handleSearch();
                    },
                    child: Container(
                      height: 48.h,
                      padding: EdgeInsets.only(
                          top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                      margin: EdgeInsets.only(left: 12.w, right: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 10, // Blur radius
                            offset: Offset(0, 3), // Offset from top
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          SizedBox(width: 4.w),
                          Text("ابحث"),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom:
                      100, // you can change place of search bar any where on the map
                  child: widget.isPreview == true
                      ? SizedBox()
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.893,
                          height: MediaQuery.of(context).size.height * 0.068,
                          decoration: BoxDecoration(
                            color: AppColors.green6E,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (widget.isDestinationLocation == true) {
                                widget.widgetRef!
                                    .read(serviceFormNotifierProvider.notifier)
                                    .setDestinationLocation(
                                        lat: latitude, lang: longitude);

                                Navigator.pop(context);
                              } else {
                                Constants.lat = latitude;
                                Constants.lang = longitude;
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'تم',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
    );
  }
}
