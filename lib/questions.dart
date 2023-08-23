import 'package:flutter/material.dart';
import 'package:quizz_app_udemy/data/questions.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  answerQuestion() {
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                )),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffeledAnswers().map((item) {
              return AnswerButton(item, answerQuestion);
            }),
          ],
        ),
      ),
    );
  }
}
