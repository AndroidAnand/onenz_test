import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/view_models/todo_view_model.dart';
import 'package:todo_app/views/home_screen.dart';

void main() {
  testWidgets('HomeScreen displays todo items', (WidgetTester tester) async {
    // 1. Create a ProviderContainer for Riverpod.
    final container = ProviderContainer();

    // 2. Add a sample todo to the provider using the notifier.
    container.read(todoProvider.notifier).addTodo(
      Todo(title: 'Test Todo Title', description: 'Test Todo Description'),
    );

    // 3. Pump HomeScreen wrapped in ProviderScope and MaterialApp.
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    // Allow animations (if any) to settle.
    await tester.pumpAndSettle();

    // 4. Verify that the todo's title and description are visible.
    expect(find.text('Test Todo Title'), findsOneWidget);
    expect(find.text('Test Todo Description'), findsOneWidget);
  });
}
