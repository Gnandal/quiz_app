import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsListWidget extends StatelessWidget {
  QuestionsListWidget(this.answers, this.answerQuestion, {super.key});
  final List<String> answers;
  void Function(String answer) answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [...answers
          .map(
            (e) => AnswerButton(onTap: answerQuestion, answerText: e),
          ),
      ]
    );
  }
}
