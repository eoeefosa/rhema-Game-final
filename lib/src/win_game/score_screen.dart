import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/commons/appBar.dart';
import 'package:rhemabiblequiz/src/main_menu/main_menu_screen.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../bible_quiz_game/provider/questions.dart';
import '../player_progress/player_progress.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final playerProgress = context.watch<PlayerProgress>();
    int durationtime = 2000;
    const gap = SizedBox(height: 10);
    final questions = context.watch<Questions>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            gap,
            AppBarWidget(
              width: size.width * .8,
              mainscreen: true,
            ),
            SizedBox(
              height: size.height * .5,
              child: Lottie.asset(
                questions.rightAnswers < 2
                    ? 'assets/animation/animation_lme1emfg.json'
                    : 'assets/animation/lmcn1iz9.json',
                repeat: false,
                controller: _controller,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _controller
                    ..duration = Duration(milliseconds: durationtime)
                    ..forward();
                },
              ),
            ),
            gap,

            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: questions.currentScore.toDouble()),
              duration: Duration(milliseconds: (durationtime * .75).toInt()),
              builder: (_, double value, child) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        'Comic Sans MS', // Use a fun and kid-friendly font
                    color: Colors.green, // Choose a fun color
                  ),
                );
              },
            ),
            gap,

            // A playful message to encourage and praise the child
            // TODO LIST OF RANDOM MESSAGES
            Text(
              questions.rightAnswers < 2 ? 'Try Again' : 'Great Job!',
              style: const TextStyle(
                fontSize: 24.0,
                fontFamily: 'Comic Sans MS',
                color: Colors.blue, // Choose a fun color
              ),
            ),
            gap,
            gap,

            // A button to return to the quiz or go back to the main menu
            SizedBox(
              width: size.width * 0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      questions.rePlayLevel();
                      final audioController = context.read<AudioController>();
                      audioController.playSfx(SfxType.buttonTap);
                      GoRouter.of(context).go(
                        '/play/quiz_game',
                      );
                      // Navigate back to the quiz or main menu
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => YourQuizScreen()));
                    },
                    child: const Text('Play Again'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      questions.nextLevel();
                      final audioController = context.read<AudioController>();
                      audioController.playSfx(SfxType.buttonTap);
                      GoRouter.of(context).go(
                        '/play/quiz_game',
                      );
                      // Navigate back to the quiz or main menu
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => YourQuizScreen()));
                    },
                    child: const Text('Next Level'),
                  ),
                ],
              ),
            ),
            gap,
            gap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final audioController = context.read<AudioController>();
                        audioController.playSfx(SfxType.buttonTap);
                        GoRouter.of(context).go(
                          MainMenuScreen.route,
                        );
                        // Navigate back to the quiz or main menu
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => YourQuizScreen()));
                      },
                      child: const Text('Main Menu'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
