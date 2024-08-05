import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
