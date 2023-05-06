import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.changeScreen, this.selectedAnswers, {Key? key})
      : super(key: key);

  final void Function(String screenName) changeScreen;
  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You correctly answered $numberOfCorrectAnswers questions out of $numberOfTotalQuestions',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: () {
                  changeScreen('questions-screen');
                },
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
