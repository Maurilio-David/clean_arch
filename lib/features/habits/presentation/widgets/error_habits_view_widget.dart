import 'package:flutter/material.dart';

class ErrorHabitsViewWidget extends StatelessWidget {
  final String error;

  const ErrorHabitsViewWidget({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
