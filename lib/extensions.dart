import 'package:flutter/material.dart';

extension Widget on double {
  SizedBox vSpace() {
    return SizedBox(height:this);
  }

  SizedBox hSpace() {
    return SizedBox(width:this);
  }
}

