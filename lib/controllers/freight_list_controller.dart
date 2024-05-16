import 'dart:async';
import 'dart:convert';

import 'package:dio_mock_interceptor/dio_mock_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio_import;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../api_service/api_end_points.dart';
import '../model/freight_list_model.dart';
import '../utilities/app_strings.dart';

class FreightListController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();

  RxList<Datum> freightList = <Datum>[].obs;

  Rx<CameraPosition> cameraPosition = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  ).obs;

  RxSet<Polyline> polylines = <Polyline>{}.obs;
  PolylinePoints polylinePoints = PolylinePoints();

  Map<MarkerId, Marker> markers = {};

  @override
  void onInit() {
    super.onInit();
  }

  // Get List of freights
  Future getFreightList() async {
    dio_import.Dio dio = dio_import.Dio(dio_import.BaseOptions());
    dio.interceptors.add(MockInterceptor());
    dio_import.Response response = await dio
        .post(ApiEndpoints.freightList); // the same path as common.json
    String json = response.data;
    if (json.isEmpty) {
      throw Exception('response is empty');
    }
    Map<String, dynamic> data = jsonDecode(json);
    try {
      var resp = Data.fromJson(data);
      if (resp.success == true) {
        freightList.addAll(resp.result?.data ?? []);
        freightList.refresh();
      }
    } catch (e) {}
  }

//   Tapped Freight location

  Future<void> getLocation(double lat, double lng) async {
    cameraPosition.value = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 9,
    );
    final GoogleMapController controller = await mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition.value));
    cameraPosition.refresh();
  }

//   Routing

  void getPolyline(double oLat,double oLng,double dLat,double dLng) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppStrings.mapKey,
      PointLatLng(oLat, oLng),
      PointLatLng(dLat, dLng),
      travelMode: TravelMode.transit
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 8,
    );
    polylines.add(polyline);
    polylines.refresh();
  }
}
