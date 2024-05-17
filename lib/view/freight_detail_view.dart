
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freight_delivery_app/controllers/freight_list_controller.dart';
import 'package:freight_delivery_app/extensions.dart' as extensions;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_images.dart';
import '../utilities/spacing.dart';

class FreightDetailView extends StatefulWidget {
  int? selectedIndex;

  FreightDetailView({super.key, this.selectedIndex = 0});

  @override
  State<FreightDetailView> createState() => _FreightDetailViewState();
}

class _FreightDetailViewState extends State<FreightDetailView> {
  FreightListController controller = Get.find();

  List<String> productList = [
    "Reebok (Pack of 10)",
    "WildCraft (Pack of 11)",
    "Nike(Pack of 14)"
  ];

  @override
  void initState() {
    controller.cameraPosition();
    controller.getLocation(
        double.parse(controller.freightList[widget.selectedIndex!].currLat!),
        double.parse(controller.freightList[widget.selectedIndex!].currLon!));

    addMarker(
      LatLng(
          double.parse(controller.freightList[widget.selectedIndex!].orgLatLon!
              .split(",")[0]!),
          double.parse(controller.freightList[widget.selectedIndex!].orgLatLon!
              .split(",")[1]!)),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    // Add destination marker
    addMarker(
      LatLng(
          double.parse(controller.freightList[widget.selectedIndex!].desLatLon!
              .split(",")[0]!),
          double.parse(controller.freightList[widget.selectedIndex!].desLatLon!
              .split(",")[1]!)),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );

    // Add Current marker
    addMarker(
      LatLng(
          double.parse(controller.freightList[widget.selectedIndex!].currLat!),
          double.parse(controller.freightList[widget.selectedIndex!].currLon!)),
      "current",
      BitmapDescriptor.defaultMarkerWithHue(180),
    );

    controller.getPolyline(
        double.parse(controller.freightList[widget.selectedIndex!].orgLatLon!
            .split(",")[0]),
        double.parse(controller.freightList[widget.selectedIndex!].orgLatLon!
            .split(",")[1]),
        double.parse(controller.freightList[widget.selectedIndex!].desLatLon!
            .split(",")[0]),
        double.parse(controller.freightList[widget.selectedIndex!].desLatLon!
            .split(",")[1]));
    super.initState();
  }

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    controller.markers[markerId] = marker;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: ValueKey("detailPage"),
        title:
            Text(controller.freightList[widget.selectedIndex!].bookingId ?? ""),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            stretch: true,
            pinned: true,
            onStretchTrigger: () async {},
            backgroundColor: AppColors.greyColor,
            flexibleSpace: Stack(
              children: [
                const FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                    StretchMode.blurBackground,
                  ],
                  collapseMode: CollapseMode.pin,
                ),
                Obx(
                  () => GoogleMap(
                    scrollGesturesEnabled: true,
                    initialCameraPosition: controller.cameraPosition.value,
                    mapType: MapType.normal,
                    myLocationEnabled: false,
                    zoomControlsEnabled: true,
                    mapToolbarEnabled: false,
                    polylines: controller.polylines,
                    markers: Set<Marker>.of(controller.markers.values),
                    onTap: (latLng) {},
                    onMapCreated: (GoogleMapController cn) {
                      controller.mapController.complete(cn);
                    },
                    compassEnabled: false,
                    onCameraIdle: () {},
                    circles: {
                      Circle(
                        circleId: const CircleId('currentCircle'),
                        radius: 10000,
                        center: LatLng(
                            double.parse(controller
                                .freightList[widget.selectedIndex!].currLat!),
                            double.parse(controller
                                .freightList[widget.selectedIndex!].currLon!)),
                        fillColor: Colors.blue.withOpacity(0.7),
                        strokeColor: Colors.blue.shade100.withOpacity(0.9),
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Material : ${controller.freightList[widget.selectedIndex!].materialShipped}',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: AppColors.shadowColor)]),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.packageBoxSvg,
                          width: 50,
                        ),
                        AppSpacing.vs10.hSpace(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "#${controller.freightList[widget.selectedIndex!].bookingId}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                                "${controller.freightList[widget.selectedIndex!].currentStatus} * ${controller.freightList[widget.selectedIndex!].actualEta}",
                                style: const TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    20.0.vSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "From",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${controller.freightList[widget.selectedIndex!].originLocation}",
                                  style: const TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  softWrap: true,
                                )
                              ]),
                        ),
                        50.0.hSpace(),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("To",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                Text(
                                  "${controller.freightList[widget.selectedIndex!].destinationLocation}",
                                  style: const TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  softWrap: true,
                                )
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Item List",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: productList.length,
                  itemBuilder: (context, position) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        productList[position],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    );
                  })
            ]),
          )
        ],
      ),
    );
  }
}
