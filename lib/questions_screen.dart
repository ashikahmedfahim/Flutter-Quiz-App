import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/option_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.changeScreen, this.addToSelectedAnswer, {Key? key})
      : super(key: key);

  final void Function(String screenName) changeScreen;
  final void Function(String answer) addToSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    if (currentQuestionIndex + 1 < questions.length) {
      widget.addToSelectedAnswer(selectedAnswer);
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      widget.changeScreen('home-screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
                  (e) => OptionButton(e, answerQuestion),
                )
          ],
        ),
      ),
    );
  }
}
