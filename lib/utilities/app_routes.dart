import 'package:freight_delivery_app/view/freight_detail_view.dart';
import 'package:freight_delivery_app/view/freight_listing_view.dart';
import 'package:freight_delivery_app/view/splash_view.dart';
import 'package:get/get.dart';

import '../view/login_view.dart';

class AppRoutes {
  static Future? go(String routeName,
          {dynamic arguments, bool preventDuplicates = true}) =>
      Get.toNamed(
        routeName,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
      );

  static void pop() => Get.back();

  static void pushAndRemoveUntil(
    String name, {
    dynamic arguments,
  }) =>
      Get.offAllNamed(
        name,
        arguments: arguments,
      );
}

class AppRouteName {
  static const String splashView = '/splash_route',
      freightView = '/freight_listing_route',
      freightDetailView = '/freight_detail_route',
      loginView = '/login_route';
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: freightView,
      page: () => FreightListingView(),
    ),
    GetPage(name: splashView, page: () => const SplashView()),
    GetPage(name: loginView, page: () => LoginView()),
    GetPage(
        name: freightDetailView,
        page: () => FreightDetailView(
              selectedIndex: Get.arguments["selectedIndex"] ?? "",
            )),
  ];
}
