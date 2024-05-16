import 'package:flutter_test/flutter_test.dart';
import 'package:freight_delivery_app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  final authController = Get.put(AuthController());



  test('Check login logic for valid user', () async {
    String email = "zain@gmail.com";
    String password = "Ambitious123";
    var result = await authController.tappedContinue(email, password);

    expect(result, true);
  });

  test('Check login logic for invalid user', () async {
    String email = "asdf@gmail.com";
    String password = "Ambitious123";
    var result = await authController.tappedContinue(email, password);
    expect(result, false);
  });
}
