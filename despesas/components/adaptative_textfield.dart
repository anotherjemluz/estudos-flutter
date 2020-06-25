import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController ctrl;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    this.label,
    this.ctrl,
    this.keyboardType = TextInputType.text,
    this.onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
      ? Padding(
        padding: const EdgeInsets.only(
          bottom: 10
        ),
        child: CupertinoTextField(
          controller: ctrl,
          keyboardType: keyboardType,
          onSubmitted: onSubmitted,
          placeholder: label,
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12
          ),
        ),
      )
      : TextField(
        controller: ctrl,
        keyboardType: keyboardType,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: label
        ),
      );
  }
}