import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/navigation/navigation_service.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

class AddTodoScreenViewModel {
  final WidgetRef ref;
  // Hold the form field values.
  String title = '';
  String description = '';

  AddTodoScreenViewModel(this.ref);

  // Setter for title.
  void setTitle(String value) {
    title = value;
  }

  // Setter for description.
  void setDescription(String value) {
    description = value;
  }

  // This method validates the form (using the provided formKey),
  // saves the form (which calls our onSaved callbacks to update our local fields),
  // then adds the todo and navigates back.
  void saveForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      // Trigger all onSaved callbacks.
      formKey.currentState?.save();
      // Add the new todo item.
      ref.read(todoProvider.notifier).addTodo(
        Todo(title: title, description: description),
      );
      // Navigate back using the global navigation service.
      NavigationService.instance.pop();
    }
  }
}
