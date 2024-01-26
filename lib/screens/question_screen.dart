import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/widgets/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen(this.quizQuestion, this.answerQuestion, {super.key});

  final QuizQuestion quizQuestion;
  void Function(String answer) answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                quizQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white70,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              QuestionsListWidget(quizQuestion.shuffleAnswers, answerQuestion)
            ],
          ),
        ),
      ),
    );
  }
}
