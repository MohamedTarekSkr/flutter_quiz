import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summeryData, {super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData.map((item) {
            final isCorrect = item['correct_answer'] == item['user_answer'];

            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? const Color.fromARGB(255, 125, 223, 255)
                          : const Color.fromARGB(255, 240, 144, 248),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ((item['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 38, 4, 61),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 202, 171, 252),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 181, 254, 246),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
