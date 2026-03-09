import 'package:flutter/material.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summeryData, {super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData.map((item) {
            return Row(
              children: [
                Text(((item['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(item['question'] as String),
                      SizedBox(height: 5),
                      Text(item['correct_answer'] as String),
                      Text(item['user_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
