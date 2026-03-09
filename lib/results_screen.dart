import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summery.dart';

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
        'user_answer': choosenAnswers[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    var summeryData = getSummery();
    var numTotalQuestions = questions.length;
    var numCorrectQuestions = summeryData.where((data){
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly"),
            SizedBox(height: 10),
            Text("List of answers and questions..."),
            SizedBox(height: 10),
            QuestionsSummery(getSummery()),
            SizedBox(height: 10),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz!"))
          ],
        ),
      ),
    );
  }
}
