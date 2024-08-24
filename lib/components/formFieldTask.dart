import 'package:flutter/material.dart';

class FormFieldTask extends StatelessWidget {
  final String title;
  final TextEditingController formFieldTaskController;
  final TextInputType typeKeyboard;

  const FormFieldTask({
    super.key,
    required this.title,
    required this.formFieldTaskController,
    this.typeKeyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: typeKeyboard,
        controller: formFieldTaskController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: title,
          fillColor: Colors.white70,
          filled: true,
        ),
      ),
    );
  }
}
