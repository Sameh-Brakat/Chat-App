import 'package:flutter/material.dart';

customTextForm({
  required String hintText,
  required TextEditingController controller,
  Function(String)? onChanged,
}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'this field must not be empty';
        }
      },
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
