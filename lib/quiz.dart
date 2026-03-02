import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';

import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
 
}

class _QuizState extends State<Quiz>{
var activeScreen = 'start-screen';

  // late Widget activeScreen;
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 187, 83, 206),
              Color.fromARGB(255, 92, 24, 104),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionsScreen(),
        )
      ),
    );
  }
}
