import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';

class TodoViewModel extends StateNotifier<List<Todo>> {
  TodoViewModel() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void toggleTodoStatus(int index) {
    final updatedTodo = state[index].copyWith(isDone: !state[index].isDone);
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) updatedTodo else state[i]
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoViewModel, List<Todo>>((ref) {
  return TodoViewModel();
});
