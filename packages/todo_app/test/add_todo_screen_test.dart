import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/navigation/navigation_service.dart';
import 'package:todo_app/view_models/todo_view_model.dart';
import 'package:todo_app/views/home_screen.dart';
import 'package:todo_app/views/add_todo_screen.dart';

void main() {
  testWidgets('AddTodoScreen adds a new todo with proper navigation',
          (WidgetTester tester) async {
        // 1. Define a GoRouter with HomeScreen and AddTodoScreen routes.
        final testRouter = GoRouter(
          navigatorKey: NavigationService.instance.navigatorKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: '/add',
              builder: (context, state) => const AddTodoScreen(),
            ),
          ],
          // Start at HomeScreen.
          initialLocation: '/',
        );

        // 2. Create a ProviderContainer for Riverpod.
        final container = ProviderContainer();

        // 3. Pump the MaterialApp.router with the testRouter and ProviderScope.
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp.router(
              routerDelegate: testRouter.routerDelegate,
              routeInformationParser: testRouter.routeInformationParser,
              routeInformationProvider: testRouter.routeInformationProvider,
            ),
          ),
        );

        // Verify HomeScreen is initially displayed.
        expect(find.byType(HomeScreen), findsOneWidget);

        // 4. Navigate to AddTodoScreen by pushing '/add'.
        final homeContext = tester.element(find.byType(HomeScreen));
        GoRouter.of(homeContext).push('/add');
        await tester.pumpAndSettle();

        // Verify that AddTodoScreen is now displayed.
        expect(find.byType(AddTodoScreen), findsOneWidget);

        // 5. Locate text fields using their assigned Keys.
        final titleField = find.byKey(const Key('titleField'));
        final descriptionField = find.byKey(const Key('descriptionField'));

        // Enter text into Title and Description fields.
        await tester.enterText(titleField, 'Test Title');
        await tester.enterText(descriptionField, 'Test Description');

        // 6. Tap the Save button.
        final saveButton = find.text('Save');
        await tester.tap(saveButton);
        await tester.pumpAndSettle();

        // 7. Verify that the new todo was added.
        final todos = container.read(todoProvider);
        expect(todos.length, 1);
        expect(todos.first.title, 'Test Title');
        expect(todos.first.description, 'Test Description');
        expect(todos.first.isDone, isFalse);

        // 8. Verify that after pop, the AddTodoScreen is removed.
        expect(find.byType(AddTodoScreen), findsNothing);
        // Optionally, verify that HomeScreen is visible.
        expect(find.byType(HomeScreen), findsOneWidget);
      });
}
