import 'package:flutter/material.dart';

customButton({
  required String text,
  required void Function()? onPressed,
}) =>
    SizedBox(
      width: double.infinity,
      child: MaterialButton(
        height: 50,
        color: Colors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
