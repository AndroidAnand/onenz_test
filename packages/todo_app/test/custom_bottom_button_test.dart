import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_elements/custom_bottom_button.dart';

void main() {
  testWidgets('CustomBottomButton displays label and triggers onPressed',
          (WidgetTester tester) async {
        // Create a flag to verify that onPressed is called.
        bool pressed = false;

        // Build the widget tree.
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomBottomButton(
                label: 'Test Button',
                onPressed: () {
                  pressed = true;
                },
              ),
            ),
          ),
        );

        // Verify that the button displays the correct label.
        expect(find.text('Test Button'), findsOneWidget);

        // Tap the button.
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();

        // Verify that the onPressed callback was triggered.
        expect(pressed, isTrue);
      });
}
