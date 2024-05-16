import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freight_delivery_app/utilities/app_anims.dart';
import 'package:lottie/lottie.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_const.dart';
import '../utilities/app_routes.dart';
import '../utilities/app_state.dart';
import '../utilities/get_prefs.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLoggedIn = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    isLoggedIn = GetPrefs.getBool(GetPrefs.isLoggedIn);
    AppState.instance.setUserId = GetPrefs.getString(AppConst.userId);
    if(kDebugMode) {
      print(AppState.instance.getUserId);
    }
    AppState.instance.setUserImage = GetPrefs.getString(AppConst.userImage);
    AppState.instance.setUserName = GetPrefs.getString(AppConst.userName);

    Future.delayed(const Duration(milliseconds: 3000), () {
      AppRoutes.pushAndRemoveUntil(
          isLoggedIn ? AppRouteName.freightView : AppRouteName.loginView);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 0.5,
                  spreadRadius: 0.0, // shadow direction: bottom right
                )
              ]),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                    AppAnim.trackAnim),
                const SizedBox(height: 30),
                const Text(
                  'Track Your Freight',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )
              ]),
        ),
      ),
    );
  }
}
