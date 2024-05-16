import 'package:flutter/material.dart';
import 'package:freight_delivery_app/components/app_button.dart';
import 'package:freight_delivery_app/extensions.dart' as extensions;
import 'package:freight_delivery_app/utilities/app_anims.dart';
import 'package:freight_delivery_app/utilities/app_routes.dart';
import 'package:freight_delivery_app/utilities/app_strings.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../components/app_form_field.dart';
import '../controllers/auth_controller.dart';
import '../utilities/spacing.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: authController.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  AppAnim.trackAnim2,
                  height: 200,
                ),
                AppSpacing.vs20.vSpace(),
                AppFormField(
                  controller: authController.loginEmailTxtCn,
                  hint: AppStrings.emailHint,
                  inputType: TextInputType.emailAddress,
                ),
                AppSpacing.vs20.vSpace(),
                AppFormField(
                  controller: authController.loginPwdTxtCn,
                  hint: AppStrings.pwdHint,
                  inputType: TextInputType.visiblePassword,
                ),
                AppSpacing.vs20.vSpace(),
                AppButton(
                  title: AppStrings.titleContinue,
                  onTap: () async {
                    var validateResult = authController.loginFormKey.currentState!.validate();
                    if (validateResult) {
                      var isValiduser = await authController.tappedContinue(
                          authController.loginEmailTxtCn.text,
                          authController.loginPwdTxtCn.text);
                      if (isValiduser == true) {
                        AppRoutes.go(AppRouteName.freightView);
                      } else {
                        Get.snackbar(
                            "Validation Error", "Invalid User Credentials");
                      }
                    }
                  },
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
