import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions.dart';
import 'package:flutter_quiz/results_screen.dart';

import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAsnwers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAsnwers.add(answer);

    if (selectedAsnwers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWindget = StartScreen(switchScreen);
    if(activeScreen == 'question-screen'){
      screenWindget = QuestionsScreen(onSelectedelectedAnswer: chooseAnswer);
    }
    if(activeScreen == 'results-screen'){
      screenWindget = ResultsScreen(choosenAnswers: selectedAsnwers,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 187, 83, 206),
                Color.fromARGB(255, 92, 24, 104),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWindget,
        ),
      ),
    );
  }
}
