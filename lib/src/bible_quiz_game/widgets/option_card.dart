// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.answerCardStatus,
    this.onTap,
  }) : super(key: key);

  final String option;
  final AnswerCardStatus answerCardStatus;
  final VoidCallback? onTap;

//   @override
//   State<OptionCard> createState() => OptionCardState();
// }

// class OptionCardState extends State<OptionCard> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hight = size.height * .07;
    final width = size.width * .7;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 8.0,
        backgroundColor: bgColor(answerCardStatus),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: SizedBox(
          height: hight,
          width: width,
          child: Center(
            child: Text(
              option,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
                fontFamily: 'Comic Sans MS',
                color: textColor(answerCardStatus),
              ),
            ),
          )),
    );
  }
}

// LinearGradient bgGradient(AnswerCardStatus answerCardStatus) {
//   switch (answerCardStatus) {
//     case AnswerCardStatus.error:
//       return const LinearGradient(colors: [
//         Color.fromRGBO(234, 145, 5, 1),
//         Color.fromARGB(71, 255, 79, 62)
//       ]);
//     case AnswerCardStatus.right:
//       return const LinearGradient(colors: [
//         Color.fromRGBO(158, 254, 22, 1),
//         Color.fromARGB(55, 69, 255, 76)
//       ]);

//     default:
//       return const LinearGradient(
//           colors: [Colors.transparent, Colors.transparent]);
//   }
// }

Color textColor(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.error:
      return Colors.redAccent;
    case AnswerCardStatus.right:
      return Colors.green;
    case AnswerCardStatus.disabled:
      return Colors.black26;
    default:
      return Colors.white;
    // return const Color.fromRGBO(74, 55, 50, 1);
  }
}

Color borderColor(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.error:
      return Colors.redAccent;
    case AnswerCardStatus.right:
      return Colors.green;
    case AnswerCardStatus.disabled:
      return Colors.grey.shade100;
    default:
      return Colors.grey.shade300;
  }
}

Color bgColor(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.error:
      return Colors.red.shade900.withAlpha(190);
    case AnswerCardStatus.right:
      return Colors.green.shade900.withAlpha(230);

    default:
      return const Color.fromARGB(255, 181, 134, 80);
  }
}

IconData adaptiveIcon(AnswerCardStatus answerCardStatus) {
  switch (answerCardStatus) {
    case AnswerCardStatus.error:
      return Icons.error;
    case AnswerCardStatus.right:
      return Icons.check_circle;

    default:
      return Icons.circle_outlined;
  }
}
