import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isMultiline;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  // We allow a 'fieldKey' so a parent widget can assign a Key
  // to the underlying TextFormField for test-friendliness.
  final Key? fieldKey;

  const CustomTextField({
    super.key,
    required this.label,
    this.isMultiline = false,
    this.onSaved,
    this.validator,
    this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey, // Use the fieldKey if provided
      onSaved: onSaved,
      validator: validator,
      minLines: isMultiline ? 3 : 1,
      maxLines: isMultiline ? null : 1,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
