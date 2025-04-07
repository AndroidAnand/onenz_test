import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/view_models/TodoViewModel.dart';

void main() {
  group('TodoViewModel Tests', () {
    test('Initial state should be an empty list', () {
      // Arrange
      final container = ProviderContainer();
      final todos = container.read(todoProvider);

      // Assert
      expect(todos, isEmpty);
    });

    test('Should add a new todo', () {
      // Arrange
      final container = ProviderContainer();
      final todoNotifier = container.read(todoProvider.notifier);

      // Act
      todoNotifier.addTodo(
        Todo(title: 'New Todo', description: 'Test Description'),
      );

      // Assert
      final updatedTodos = container.read(todoProvider);
      expect(updatedTodos.length, 1);
      expect(updatedTodos.first.title, 'New Todo');
      expect(updatedTodos.first.description, 'Test Description');
      expect(updatedTodos.first.isDone, false);
    });

    test('Should toggle todo status', () {
      // Arrange
      final container = ProviderContainer();
      final todoNotifier = container.read(todoProvider.notifier);
      todoNotifier.addTodo(
        Todo(title: 'Task', description: 'Toggle status test'),
      );

      // Act
      todoNotifier.toggleTodoStatus(0);

      // Assert
      final updatedTodos = container.read(todoProvider);
      expect(updatedTodos[0].isDone, true);

      // Toggle again
      todoNotifier.toggleTodoStatus(0);
      final toggledBackTodos = container.read(todoProvider);
      expect(toggledBackTodos[0].isDone, false);
    });
  });
}
