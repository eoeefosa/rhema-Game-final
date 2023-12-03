import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/widgets/buttomoption.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/widgets/options.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/widgets/quiz_title_bar.dart';

import '../widgets/customButton.dart';
import '../widgets/option_card.dart';
import '../widgets/questionplaceholdre.dart';
import '../widgets/waveclipper.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
        return Stack(children: [
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
                    child: Column(children: [
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
                          (index) => Padding(
                                padding: EdgeInsets.all(gap.height!),
                                child: OptionCard(
                                  option:
                                      question.currentQuestion.options[index],
                                  answerCardStatus:
                                      question.answersStatus[index],
                                  onTap: () {
                                    question.chooseAnswer(index);
                                  },
                                ),
                              )),
                      gap,
                      gap,
                      const ButtomOptions(),
                      if (question.isChoseOption) ...[
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          padding: 0,
                          onPressed: question.isFinish
                              ? () {
                                  GoRouter.of(context).go('/play/won_quiz',
                                      extra: {'score': question.currentScore});
                                }
                              : question.nextQuestion,
                          text: question.isFinish
                              ? 'See my Score'
                              : 'Next Question',
                        ),
                      ],
                    ]),
                  ),
                ],
              ),
            ]),
          )
        ]);
        // return Column(
        //   children: [
        //     const SizedBox(height: 8),
        //     Titlebar(
        //       leveldifficulty: 'Level ${question.currentLevel}',
        //       maxStar: question.ratings[question.currentLevel!],
        //       score: question.rightAnswers,
        //       life: question.rightAnswers,
        //       totalseconds: 60,
        //       currentseconds: question.seconds,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 15),
        //       width: double.infinity,
        //       child: Text(
        //         'Question ${question.currentQuestionIndex + 1}/4',
        //         textAlign: TextAlign.start,
        //         style: const TextStyle(fontSize: 25),
        //       ),
        //     ),
        //     Container(
        //       decoration: const BoxDecoration(),
        //       child: Center(
        //         child: Text(
        //           question.currentQuestion.question,
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ),
        //     ...List.generate(
        //         question.currentQuestion.options.length,
        //         (index) => OptionCard(
        //               option: question.currentQuestion.options[index],
        //               answerCardStatus: question.answersStatus[index],
        //               onTap: () {
        //                 question.chooseAnswer(index);
        //               },
        //             )),
        //     if (question.isChoseOption) ...[
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       CustomButton(
        //         padding: 0,
        //         onPressed: question.isFinish
        //             ? () {
        //                 GoRouter.of(context).go('/play/won_quiz',
        //                     extra: {'score': question.currentScore});
        //               }
        //             : question.nextQuestion,
        //         text: question.isFinish ? 'See my Score' : 'Next Question',
        //       ),
        //     ]
        //   ],
        // );
      }),
    ));
  }
}
