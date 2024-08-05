import 'package:flutter/material.dart';
import 'package:quiz_application/components/custom_button.dart';
import 'package:quiz_application/components/question_result.dart';
import 'package:quiz_application/components/question_text.dart';
import 'package:quiz_application/source/questions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> results = <bool>[];
  int currentIndex = 0;
  // final currentQuestion = questions.entries.first;

  void _checkAnswer({required bool value}) {
    if (questions.values.elementAt(currentIndex) == value) {
      results.add(true);
    } else {
      results.add(false);
    }

    if (questions.length == currentIndex + 1) {
      final tuuraJooptor = results.where((e) => e == true).toList();

      showDialog(
        context: context,
        builder: (context) => AlertDialog.adaptive(
          title: const Text('Тест бүттү : )'),
          content: Text('${tuuraJooptor.length}/${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                currentIndex = 0;
                results.clear();
                Navigator.pop(context);
                setState(() {});
              },
              child: const Text('Кайра баштоо'),
            ),
          ],
        ),
      );
    } else {
      currentIndex++;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Тапшырма 7',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          QuestionText(
            text: questions.keys.elementAt(currentIndex),
          ),
          const SizedBox(
            height: 100,
          ),
          CustomButton(
            color: const Color(0xff4CB050),
            text: 'Туура',
            onPressed: () {
              _checkAnswer(value: true);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            color: const Color(0xffEF443A),
            text: 'Туура эмес',
            onPressed: () {
              _checkAnswer(value: false);
            },
          ),
          const Spacer(),
          QuestionResult(
            results: results,
          ),
        ],
      ),
    );
  }
}
