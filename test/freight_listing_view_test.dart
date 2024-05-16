import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_delivery_app/view/freight_listing_view.dart';
import 'package:get/get.dart';

void main() {
  testWidgets("test for freight list rendering", (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(GetMaterialApp(home: FreightListingView()));

  //   Act
    Finder listView = find.byType(ListView);

  //   Assert
    await tester.pumpAndSettle();
    expect(listView, findsOneWidget);
  });
}
