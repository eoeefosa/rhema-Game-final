import 'package:flutter/material.dart';

import '../provider/questions.dart';

class Options extends StatelessWidget {
  const Options({
    super.key,
    required this.option,
    required this.answerCardStatus,
    this.onTap,
  });
  final String option;
  final AnswerCardStatus answerCardStatus;
  final VoidCallback? onTap;
  // final String text;
  // final Gradient color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hight = size.height * .07;
    final width = size.width * .7;
    return Material(
        elevation: 8,
        shape: BeveledRectangleBorder(
            side: const BorderSide(width: 5, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(80)),
        child: Stack(
          children: [
            Container(
              height: hight,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/images/boob.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            InkWell(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: bgGradient(answerCardStatus),
                ),
                height: hight,
                width: width,
                child: Center(
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(74, 55, 50, 1),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

LinearGradient bgGradient(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.error:
      return const LinearGradient(colors: [
        Color.fromRGBO(234, 145, 5, 1),
        Color.fromARGB(71, 255, 79, 62)
      ]);
    case AnswerCardStatus.right:
      return const LinearGradient(colors: [
        Color.fromRGBO(158, 254, 22, 1),
        Color.fromARGB(55, 69, 255, 76)
      ]);

    default:
      return const LinearGradient(
          colors: [Colors.transparent, Colors.transparent]);
  }
}
