import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/view_models/HomeScreenViewModel.dart';
import 'package:ui_elements/CustomTodoCard.dart';
import 'package:ui_elements/custom_bottom_button.dart';
import 'package:ui_elements/CustomTitleText.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create the view model instance.
    final viewModel = HomeScreenViewModel(ref);
    final todos = viewModel.todos;

    return Scaffold(
      appBar: AppBar(
        title: const CustomTitleText(text: 'Home'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: todos.isEmpty ? const Center(child: Text('No todos available')) :
        ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return CustomTodoCard(
              title: todo.title,
              description: todo.description,
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomBottomButton(
          label: 'Add To-Do',
          onPressed: viewModel.onAddTodoButtonPressed,
        ),
      ),
    );
  }
}
