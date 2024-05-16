import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freight_delivery_app/components/app_form_field.dart';
import 'package:freight_delivery_app/extensions.dart' as extensions;
import 'package:freight_delivery_app/utilities/app_colors.dart';
import 'package:freight_delivery_app/utilities/app_images.dart';
import 'package:freight_delivery_app/utilities/app_routes.dart';
import 'package:freight_delivery_app/utilities/app_strings.dart';
import 'package:get/get.dart';

import '../controllers/freight_list_controller.dart';
import '../utilities/spacing.dart';

class FreightListingView extends StatefulWidget {
  const FreightListingView({super.key});

  @override
  State<FreightListingView> createState() => _FreightListingViewState();
}

class _FreightListingViewState extends State<FreightListingView> {
  FreightListController controller = Get.put(FreightListController());

  @override
  void initState() {
    controller.getFreightList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 120,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Let's track your freight.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            20.0.vSpace(),
            AppFormField(
              prefixIcon: const Icon(CupertinoIcons.search),
              fillColor: Colors.white,
              hint: AppStrings.searchHint,
            )
          ],
        ),
      ),
      body: Obx(
            () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.freightList.length,
            itemBuilder: (context, position) {
              return InkWell(
                onTap: (){
                  AppRoutes.go(AppRouteName.freightDetailView,arguments: {"selectedIndex":position});
                },
                child: Container(
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
                                "#${controller.freightList[position].bookingId}",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                  "${controller.freightList[position].currentStatus} * ${controller.freightList[position].actualEta}",
                                  style: const TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          const Spacer(),
                          SvgPicture.asset(AppImages.chevronSvg)
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
                                    "${controller.freightList[position].originLocation}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
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
                                    overflow: TextOverflow.ellipsis,
                                    "${controller.freightList[position].destinationLocation}",
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
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}



