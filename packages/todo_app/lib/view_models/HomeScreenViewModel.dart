import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/navigation/NavigationService.dart';
import 'package:todo_app/view_models/TodoViewModel.dart';

class HomeScreenViewModel {
  final WidgetRef ref;

  HomeScreenViewModel(this.ref);

  // Expose the list of todos.
  List<Todo> get todos => ref.watch(todoProvider);

  // When the button is pressed, navigate using the NavigationService.
  void onAddTodoButtonPressed() {
    NavigationService.instance.push('/add');
  }
}
