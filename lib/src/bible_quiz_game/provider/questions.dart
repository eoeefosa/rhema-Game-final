import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/data/question_data.dart';

import '../model/question_model.dart';

enum AnswerCardStatus {
  normal,
  disabled,
  error,
  right,
}

final ChangeNotifierProvider<Questions> questionsProvider =
    ChangeNotifierProvider<Questions>(create: (context) => Questions());

class Questions extends ChangeNotifier {
  Questions();
  // TODO GameUser
  int? currentLevel;
  int currentQuestionIndex = 0;
  int? currentQuestionAnswerIndex;
  int _rightAnswers = 0;
  bool _isFinish = false;
  int? currentScore;

  bool get isFinish => _isFinish;

  int get rightAnswers => _rightAnswers;
  Timer? timer;
  int seconds = 60;

  VoidCallback? _onWin;

  Question get currentQuestion =>
      questions[currentLevel! * 4 + currentQuestionIndex];
  // TODO: CHANGE THE LEVELS IN THIS
  List<int> ratings = List.generate(11, (index) => 0);

  int get maxlevel => questions.last.level;
  Timer? questionTimer;

  List<Question> questions =
      questionsData.map((e) => Question.fromMap(e)).toList();
  bool get isChoseOption => answersStatus.contains(AnswerCardStatus.right);
  List<AnswerCardStatus> get answersStatus {
    // if no option is selected set AnswerCard to normal
    if (currentQuestionAnswerIndex == null) {
      return List.generate(
          currentQuestion.options.length, (index) => AnswerCardStatus.normal);
    } // if right option is selected set right option to right and other options to disabled
    else if (currentQuestion.options[currentQuestionAnswerIndex!] ==
        currentQuestion.answer) {
      return List.generate(currentQuestion.options.length, (index) {
        if (index == currentQuestionAnswerIndex) {
          return AnswerCardStatus.right;
        }
        return AnswerCardStatus.disabled;
      });
    } // if wrong answer is chosen set selected option to error and right answer to right
    else {
      return List.generate(currentQuestion.options.length, (index) {
        if (index == currentQuestionAnswerIndex) {
          return AnswerCardStatus.error;
        }
        if (currentQuestion.options[index] == currentQuestion.answer) {
          return AnswerCardStatus.right;
        }
        return AnswerCardStatus.disabled;
      });
    }
  }

  void changeRating(int rating, int level) {
    ratings[level] = rating;
    notifyListeners();
  }

  void attachCallBackFunction(VoidCallback onWin) {
    _onWin = onWin;
  }

  void rePlayLevel() {
    if (currentLevel != null) {
      currentQuestionIndex = 0;
      currentQuestionAnswerIndex = null;
      _isFinish = false;

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds == 0) {
          timer.cancel();
        } else {
          seconds--;
        }
        notifyListeners();
      });
    }
  }

  void nextLevel() {
    final oldlevel = currentLevel;
    if (currentLevel != null) {
      if (oldlevel! < maxlevel) {
        currentLevel = oldlevel + 1;
      }
      currentQuestionIndex = 0;
      currentQuestionAnswerIndex = null;
      _isFinish = false;

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds == 0) {
          timer.cancel();
        } else {
          seconds--;
        }
        notifyListeners();
      });
    }
  }

  void chooseLevel(int level) {
    currentLevel = level;
    // TODO: MIGHT REMOVE THIS
    currentQuestionIndex = 0;
    currentQuestionAnswerIndex = null;
    _isFinish = false;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
      }
      notifyListeners();
    });
  }

  void updateCurrentLevelRating() {
    int prevRating = ratings[currentLevel!];
    // 2/4 scored
    if (_rightAnswers <= 2) {
      ratings[currentLevel!] = max(1, prevRating);
    } //3/4 scored
    else if (_rightAnswers <= 3) {
      ratings[currentLevel!] = max(2, prevRating);
    } else if (_rightAnswers == 4) {
      ratings[currentLevel!] = max(3, prevRating);
    }
  }

  void reset() {
    currentScore = null;
    seconds = 60;
    timer = null;
    currentLevel = null;
    currentQuestionAnswerIndex = 0;
    _rightAnswers = 0;
    _isFinish = false;
    currentQuestionAnswerIndex = null;
    notifyListeners();
  }

  void chooseAnswer(int index) {
    currentQuestionAnswerIndex = index;
    notifyListeners();
    if (currentQuestion.answer == currentQuestion.options[index]) {
      _rightAnswers++;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex == 3) {
      // TODO : I CANT REMEMBER WHY IT WAS DOWN
      _isFinish = true;
      // _onWin;
      print(_onWin);
      if (_onWin != null) {
        _onWin!();
      }

      print('Questions provider: _isFinish ran value of _isFinish=$_isFinish');
      currentScore = _rightAnswers * (60 - seconds);
      notifyListeners();

      seconds = 60;
      timer!.cancel();
      timer = null;
      updateCurrentLevelRating();
    } else {
      currentQuestionIndex++;
      currentQuestionAnswerIndex = null;
    }
    notifyListeners();
  }
}
