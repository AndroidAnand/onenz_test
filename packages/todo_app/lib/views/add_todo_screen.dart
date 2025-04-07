import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/view_models/AddTodoScreenViewModel.dart';
import 'package:ui_elements/custom_bottom_button.dart';
import 'package:ui_elements/custom_text_field.dart';
import 'package:ui_elements/CustomTitleText.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Instantiate the view model.
    final viewModel = AddTodoScreenViewModel(ref);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const CustomTitleText(text: 'Add To-Do'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Title field – delegate saving logic to viewModel.
              CustomTextField(
                fieldKey: const Key('titleField'),
                label: 'Title',
                isMultiline: false,
                onSaved: (value) => viewModel.setTitle(value ?? ''),
                validator: (value) =>
                (value == null || value.isEmpty) ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 16),
              // Description field – delegate saving logic to viewModel.
              CustomTextField(
                fieldKey: const Key('descriptionField'),
                label: 'Description',
                isMultiline: true,
                onSaved: (value) => viewModel.setDescription(value ?? ''),
                validator: (value) =>
                (value == null || value.isEmpty) ? 'Please enter a description' : null,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: bottomInset > 0 ? bottomInset : 40,
        ),
        child: CustomBottomButton(
          label: 'Save',
          onPressed: () {
            // Delegate the entire form validation, saving, and addition
            // to the view model.
            viewModel.saveForm(_formKey);
          },
        ),
      ),
    );
  }
}
