import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/questions.dart';
import '../widgets/summary_widget.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.reStart, this.selectedAnswer, {super.key});

  void Function() reStart;
  final List<String> selectedAnswer;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'selected_answer': selectedAnswer[i],
        'correct_answer': questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalSummaryData = summaryData.length;
    final totalCorrectAnswer = summaryData.where(
            (element) => element['selected_answer'] == element['correct_answer']
    ).length;

    return Scaffold(
        backgroundColor: Colors.indigo,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Answer $totalCorrectAnswer out of $totalSummaryData questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white70,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              SummaryWidget(summaryData),
              const SizedBox(
                height: 40,
              ),
              TextButton.icon(
                onPressed: reStart,
                icon: const Icon(Icons.restart_alt,
                    size: 24, color: Colors.white),
                label: const Text(
                  "Restart",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
