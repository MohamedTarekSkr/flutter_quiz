import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummery() {
    List<Map<String, Object>> summery = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[1],
        'cuser_answer': choosenAnswers[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("You answered X out of Y questions correctly"),
            SizedBox(height: 10),
            Text("List of answers and questions..."),
            SizedBox(height: 10),
            ...getSummery().forEach((key, value) {
              Text(e);
            }),
          ],
        ),
      ),
    );
  }
}
