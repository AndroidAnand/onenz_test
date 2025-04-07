import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_elements/custom_text_field.dart';

void main() {
  testWidgets('CustomTextField displays hint and calls onSaved correctly', (WidgetTester tester) async {
    // Unique key for finding the text field.
    final fieldKey = const Key('customTextField');
    String? savedValue;

    // Create a GlobalKey to control the Form.
    final formKey = GlobalKey<FormState>();

    // Pump the widget tree with MaterialApp and a Form.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: CustomTextField(
              fieldKey: fieldKey,
              label: 'Test Label',
              isMultiline: false,
              onSaved: (value) {
                savedValue = value;
              },
            ),
          ),
        ),
      ),
    );

    // Verify the CustomTextField is present.
    expect(find.byKey(fieldKey), findsOneWidget);

    // Enter text into the CustomTextField.
    await tester.enterText(find.byKey(fieldKey), 'One NZ unit CustomTextField');

    // Trigger the form's save function.
    formKey.currentState?.save();

    // Verify that the onSaved callback captured the entered value.
    expect(savedValue, 'One NZ unit CustomTextField');
  });
}
