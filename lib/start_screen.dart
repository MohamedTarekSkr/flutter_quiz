import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  static const String _quizLogoAsset = 'assets/images/quiz-logo.png';
  static const double _logoWidth = 300;
  static const double _spacing = 48;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            _quizLogoAsset,
            width: _logoWidth,
            color: const Color.fromARGB(155, 255, 255, 255),
            colorBlendMode: BlendMode.srcIn,
          ),
          const SizedBox(height: _spacing),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white.withValues(alpha: 0.2),
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
