import 'package:flutter/material.dart';

class LoadingHabitsViewWidget extends StatelessWidget {
  const LoadingHabitsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
