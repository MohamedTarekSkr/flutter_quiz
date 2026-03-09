import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summery.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });

  final List<String> choosenAnswers;
  final void Function() onRestart;

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
    var numCorrectQuestions = summeryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 255),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummery(summeryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: Text(
                "Restart Quiz!",
                style: GoogleFonts.lato(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
