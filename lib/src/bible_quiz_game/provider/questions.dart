import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/data/question_data.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/storeprovider.dart';
import 'package:rhemabiblequiz/src/store/provider/store_controller.dart';

import '../model/question_model.dart';

enum AnswerCardStatus {
  normal,
  disabled,
  error,
  right,
}

class Questions extends ChangeNotifier {
  // Questions();
  StoreProvider _storeProvider = const StoreProvider(
    addtimevalue: 10,
    hint: 2,
    adswatchvalue: 50,
    clearwrongValaue: 2,
  );

  /// Storeprovider varables
  // int _addtimevalue = 10;
  // int _hint = 2;
  // final int _adswatchvalue = 50;
  // int _clearWrongValue = 2;

  int get addTimerValue => _storeProvider.addtimevalue;
  int get clearWrongValue => _storeProvider.clearwrongValaue;
  int get adsWatchvalue => _storeProvider.adswatchvalue;
  int get hint => _storeProvider.hint;

  /// Storeprovider
  void addtimer() {
    print(_storeProvider.addtimevalue);
    if (_storeProvider.addtimevalue > 0) {
      int localAdtimevalue = _storeProvider.addtimevalue;
      localAdtimevalue--;
      print(localAdtimevalue);
      _storeProvider = _storeProvider.copyWith(addtimevalue: localAdtimevalue);
      totalseconds += 10;
      seconds += 10;
    }
  }

  void clear5050() {
    if (_storeProvider.clearwrongValaue > 0) {
      int localClearWrong = _storeProvider.clearwrongValaue;
      localClearWrong--;
      _storeProvider =
          _storeProvider.copyWith(clearwrongValaue: localClearWrong);

      options =
          questions[currentLevel! * 4 + currentQuestionIndex].clear50().options;
      notifyListeners();

      // TODO
    }
  }

  late List<String>? options;

  // final _question = currentQuestion;
  void usehint() {
    if (_storeProvider.hint > 0) {
      int localhint = _storeProvider.hint;
      localhint--;
      _storeProvider = _storeProvider.copyWith(hint: localhint);
      notifyListeners();
      showCorrectanswer();
    }
  }

  void showCorrectanswer() {
    int correctAnswer = currentQuestion.options.indexOf(currentQuestion.answer);
    chooseAnswer(correctAnswer);
    notifyListeners();
  }

  // REWARD

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  // TODO GameUser
  int? currentLevel;
  int currentQuestionIndex = 0;
  int? currentQuestionAnswerIndex;
  int _rightAnswers = 0;
  bool _isFinish = false;
  int currentScore = 0;
  int streak = 0;

  bool get isFinish => _isFinish;

  int get rightAnswers => _rightAnswers;
  Timer? timer;
  int seconds = 20;
  int totalseconds = 20;
  int remainingtime = 0;

  void resetTimevalues() {
    seconds = 20;
    totalseconds = 20;
    remainingtime = 0;
  }

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
    options = null;
    notifyListeners();
    streak = 0;

    if (currentLevel != null) {
      streak = 0;
      _rightAnswers = 0;
      currentScore = 0;
      currentQuestionIndex = 0;
      currentQuestionAnswerIndex = null;
      _isFinish = false;
      seconds = 20;

      startTimer();
      notifyListeners();
    }
  }

  void startTimer() {
    if (timer != null) {
      timer!.cancel();
    }
    seconds = 20;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
        nextQuestion();
      } else {
        seconds--;
      }
      notifyListeners();
    });
  }

  void nextLevel() {
    options = null;

    notifyListeners();
    final oldlevel = currentLevel;

    if (currentLevel != null) {
      if (oldlevel! < maxlevel) {
        currentLevel = oldlevel + 1;
      }
      streak = 0;
      _rightAnswers = 0;
      currentQuestionIndex = 0;
      currentScore = 0;
      _rightAnswers = 0;
      currentQuestionAnswerIndex = null;
      _isFinish = false;
      seconds = 20;

      startTimer();
    }
    notifyListeners();
  }

  void pauseTimer() {
    if (timer!.isActive) {
      timer!.cancel();
    }
    notifyListeners();
  }

  void resumeTimer() {
    timer!.cancel();
    startTimer();
  }

  void chooseLevel(int level) {
    options = null;

    // _isclear = false;
    notifyListeners();
    streak = 0;
    currentScore = 0;
    seconds = 20;
    _rightAnswers = 0;

    currentLevel = level;
    // TODO: MIGHT REMOVE THIS
    currentQuestionIndex = 0;
    currentQuestionAnswerIndex = null;
    _isFinish = false;
    startTimer();
    notifyListeners();
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
    currentScore = 0;
    seconds = 20;
    streak = 0;
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
    checkAnswer(index);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());
  }

  void checkAnswer(int index) {
    if (currentQuestion.answer == currentQuestion.options[index]) {
      _rightAnswers++;
      streak++;
      // notifyListeners();
    } else {
      streak = 0;
      // notifyListeners();
    }
    notifyListeners();
  }

  void nextQuestion() {
    options = null;

    // _isclear = false;
    notifyListeners();
    print('next question called');
    if (currentQuestionIndex == 3) {
      // TODO : I CANT REMEMBER WHY IT WAS DOWN
      _isFinish = true;
      // _onWin;
      print(_onWin);
      if (_onWin != null) {
        _onWin!();
      }

      currentScore = (_rightAnswers + streak) * (60 - seconds);
      notifyListeners();

      timer!.cancel();
      timer = null;
      updateCurrentLevelRating();
      seconds = 20;
    } else {
      startTimer();
      currentQuestionIndex++;
      currentQuestionAnswerIndex = null;
      notifyListeners();
    }
    notifyListeners();
  }
}
