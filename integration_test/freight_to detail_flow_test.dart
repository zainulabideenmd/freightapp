import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_delivery_app/view/freight_listing_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("freight list to details flow", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("should show detail screen on user tapping the list item",
        (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(GetMaterialApp(home: FreightListingView()));

      //   Act
      Finder listView = find.byType(ListView);

      //   Assert
      await tester.pumpAndSettle();
      expect(listView, findsOneWidget);
      await tester.tap(find.byKey(ValueKey("item->0")));
      await tester.pumpAndSettle();
      Finder map = find.byKey(ValueKey("detailPage"));
      expect(map, findsOneWidget);
    });
  });
}
