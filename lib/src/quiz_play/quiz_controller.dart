import 'package:flutter/material.dart';
import 'package:rhemabiblequiz/src/quiz_play/data/question_data_type.dart';
import 'package:rhemabiblequiz/src/quiz_play/persistence/quiz_data.dart';

class QuizController {
  final QuizData _quizData;
  QuizController(QuizData quizData) : _quizData = quizData;

  ValueNotifier<QuestionDataType> question = ValueNotifier(QuestionDataType(
    id: 0,
    question: "",
    options: ['option'],
    answer: '',
    br: "",
    level: 0,
  ));
  Future<List<QuestionDataType>> loadQuestion() {
    return _quizData.loadquestionfromdatabase();
  }
}
