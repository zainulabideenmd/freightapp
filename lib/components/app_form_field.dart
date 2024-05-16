import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

class AppFormField extends StatelessWidget {
  String? hint;
  TextEditingController? controller;
  String? errorMessage;
  TextInputType? inputType;
  Color? fillColor;
  Icon? prefixIcon;

  AppFormField(
      {super.key,
      this.hint,
      this.controller,
      this.errorMessage,
      this.inputType,
      this.fillColor = Colors.white,this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        switch (inputType) {
          case TextInputType.emailAddress:
            final validator = Validator(
              validators: [
                const RequiredValidator(),
                const EmailValidator(),
              ],
            );

            return validator.validate(
              label: hint ?? "",
              value: value,
            );

          case TextInputType.visiblePassword:
            final validator = Validator(
              validators: [
                const RequiredValidator(),
              ],
            );

            return validator.validate(
              label: hint ?? "",
              value: value,
            );
        }
      },
      decoration: InputDecoration(
          prefixIcon:prefixIcon,
          fillColor: fillColor,
          filled: true,
          hintText: hint ?? "",
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder()),
      keyboardType: inputType,
    );
  }
}
