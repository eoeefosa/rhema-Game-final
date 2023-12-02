import '../data/question_data_type.dart';

abstract class QuizData {
  Future<List<QuestionDataType>> loadquestionfromdatabase();
  Future<List<QuestionDataType>> getquestionsonline();
}
