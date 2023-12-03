import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/widgets/buttomoption.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/widgets/quiz_title_bar.dart';

import '../../audio/audio_controller.dart';
import '../../audio/sounds.dart';
import '../../game_intervals/level_state.dart';
import '../../games_services/score.dart';
import '../../player_progress/player_progress.dart';
import '../../style/confetti.dart';
import '../widgets/option_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  static const _celebrationDuration = Duration(milliseconds: 2000);
  static const _preCelebrationDuration = Duration(milliseconds: 500);
  bool _duringCelebration = false;
  late DateTime _startOfPlay;
  int? gameScore;
  int rightAnswer = 0;
  int gamelevel = 1;
  int currentquestion = 1;

  bool newLevelUnlock = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const gap = SizedBox(height: 8);
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/wood.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Consumer<Questions>(builder: (context, question, child) {
        gamelevel = question.currentLevel!;
        currentquestion = question.currentQuestionIndex;
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => LevelState(
                // TODO: CHANGE THIS TO ISFINISH
                questionisFinish: currentquestion == 3,
                onWin: _playerWon,
              ),
            ),
          ],
          child: IgnorePointer(
            ignoring: _duringCelebration,
            child: Stack(children: [
              Positioned(
                bottom: -30,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * .15,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/flower.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ListView(children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Titlebar(
                    leveldifficulty: 'Level ${question.currentLevel! + 1}',
                    maxStar: question.ratings[question.currentLevel!],
                    score: question.rightAnswers,
                    life: question.rightAnswers,
                    totalseconds: 60,
                    currentseconds: question.seconds,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: const Color.fromRGBO(230, 212, 192, 1),
                            ),
                            height: size.height * .80,
                            width: size.width * .95,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              // height: size.height * .3,
                              width: size.width * .8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(149, 125, 103, 1),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/boob.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Column(
                                children: [
                                  Text(
                                    'Question ${question.currentQuestionIndex + 1}/4',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    question.currentQuestion.question,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            gap,
                            gap,
                            ...List.generate(
                              question.currentQuestion.options.length,
                              (index) {
                                bool isSelected = false;
                                return Padding(
                                  padding: EdgeInsets.all(gap.height!),
                                  child: Consumer<LevelState>(
                                      builder: (context, levelState, child) {
                                    return OptionCard(
                                      option: question
                                          .currentQuestion.options[index],
                                      answerCardStatus:
                                          question.answersStatus[index],
                                      onTap: () async {
                                        levelState.evaluate();
                                        print(
                                            'question is finish= $currentquestion');
                                        gameScore = question.currentScore;
                                        question.updateCurrentLevelRating();
                                        rightAnswer = question.rightAnswers;

                                        if (!isSelected) {
                                          question.chooseAnswer(index);
                                        }
                                        isSelected = true;
                                        // TODO: MAKE DYNAMIC
                                        await Future.delayed(
                                            const Duration(milliseconds: 200));
                                        if (!question.isFinish) {
                                          question.nextQuestion();
                                        }
                                      },
                                    );
                                  }),
                                );
                              },
                            ),
                            gap,
                            gap,
                            const ButtomOptions(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              // TODO WHEN 4/4
              SizedBox.expand(
                child: Visibility(
                  visible: _duringCelebration,
                  child: IgnorePointer(
                    child: Confetti(
                      isStopped: !_duringCelebration,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      }),
    ));
  }

  @override
  void initState() {
    super.initState();

    _startOfPlay = DateTime.now();

    // // Preload ad for the win screen.
    // final adsRemoved =
    //     context.read<InAppPurchaseController?>()?.adRemoval.active ?? false;
    // if (!adsRemoved) {
    //   final adsController = context.read<AdsController?>();
    //   adsController?.preloadAd();
    // }
  }

  Future<void> _playerWon() async {
    print('Player won called in quiz screen');
    final finScore = Score(
      gamelevel,
      3,
      DateTime.now().difference(_startOfPlay),
    );
    final score = gameScore ?? 0;
    final playerProgress = context.read<PlayerProgress>();
    playerProgress.addPoints(score);
    final previousLevel = playerProgress.highestLevelReached;
    playerProgress.addStar(level: gamelevel, star: rightAnswer);

    if (playerProgress.highestLevelReached > previousLevel) {
      newLevelUnlock = true;
    }
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _duringCelebration = true;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.congrats);

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    // TODO gameservicesController
    GoRouter.of(context).go('/play/won_quiz', extra: {'score': score});
  }
}
