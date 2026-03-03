import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        backgroundColor: const Color.fromARGB(255, 79, 4, 141),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(40))
      ),
      child: Text(answerText, textAlign: TextAlign.center,),
    );
  }
}
