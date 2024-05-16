import 'package:flutter/material.dart';
import 'package:freight_delivery_app/api_service/networking_client.dart';
import 'package:freight_delivery_app/utilities/app_routes.dart';
import 'package:freight_delivery_app/utilities/get_prefs.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetPrefs.init();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Freight Tracking App',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: 'Hind'),
      navigatorKey: navigatorKey,
      getPages: AppRouteName.routes,
      initialRoute: AppRouteName.splashView,
    );
  }
}
