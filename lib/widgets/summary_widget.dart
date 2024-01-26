import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: e['selected_answer'] == e['correct_answer'] ? Colors.white70 : Colors.redAccent,
                      child:
                          Text(((e["question_index"] as int) + 1).toString()),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e["question"] as String,
                            style: const TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            e['selected_answer'] as String,
                            style: const TextStyle(color: Colors.purpleAccent),
                          ),
                          Text(e['correct_answer'] as String,
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 16))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
