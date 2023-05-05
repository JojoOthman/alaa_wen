import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var c;
  late double lat, lang;
  CameraPosition? _kGooglePlex;
  GoogleMapController? gmc;
  StreamSubscription<Position>? ps;
  bool showLoader = false;
  late LatLng initPos;
  Set<Marker> Markers = {};



  Future<Position?> getCurrentPosition() async {
    try {
      initPos = (await Geolocator.getCurrentPosition()) as LatLng;
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getLatLang() async {
    setState(() {
      showLoader = true;
    });
    c = await Geolocator.getCurrentPosition().then((value) => value);
    setState(() {
      showLoader = false;
    });
    if (c == null) {
      print('cant get location');
    }

    _kGooglePlex = CameraPosition(
      target: LatLng(c.latitude, c.longitude),
      zoom: 15,
    );
    initPos = LatLng(c.latitude, c.longitude);
    setState(() {});
  }

  void GoToPos(Position? position) {
    gmc?.animateCamera(CameraUpdate.newLatLng(
        LatLng(position?.latitude ?? 0, position?.longitude ?? 0)));
  }

  @override
  void initState() {

    getLatLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: SafeArea(
          child: Scaffold(
        body: showLoader
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  _kGooglePlex == null
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          child: Center(child: CircularProgressIndicator()))
                      : Container(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: GoogleMap(
                            zoomControlsEnabled: false,
                            markers: Markers,
                            mapType: MapType.normal,
                            initialCameraPosition:
                                CameraPosition(target: initPos, zoom: 16),
                            onMapCreated:
                                (GoogleMapController controller) async {
                              gmc = controller;

                              var pos = await getCurrentPosition();
                              if (pos == null) return;

                              GoToPos(pos);
                            },
                            onTap: (LatLng location) {
                              print('jooojoooooo' + location.toString());
                              setState(() {
                                Markers.add(Marker(
                                  markerId: MarkerId('1'),
                                  position: location,
                                ));
                              });
                            },
                          ),
                        ),
                ],
              ),
      )),
    );
  }
}
