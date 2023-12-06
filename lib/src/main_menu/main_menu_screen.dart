import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:rhemabiblequiz/src/commons/appBar.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../games_services/game_services_controller.dart';
import '../level_selection/level_selection_screen.dart';
import '../settings/settings.dart';
import '../settings/settings_screen.dart';
import '../style/constants.dart';
import 'list_card.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});
  static const route = '/';
  static const _gap = SizedBox(height: 10);
  @override
  Widget build(BuildContext context) {
    final palete = context.watch<Palette>();
    // TODO: INITALISE gameservicecontroller
    final gameServiceController = context.watch<GameServicesController?>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    final size = MediaQuery.of(context).size;
    const gap = SizedBox(height: 16);
    return Scaffold(
      body: Column(
        children: [
          gap,
          AppBarWidget(width: size.width * 0.8, mainscreen: true),
          gap,

          SizedBox(
            width: double.infinity,
            height: 150,
            child: Animator<double>(
                duration: const Duration(milliseconds: 1000),
                cycles: 0,
                curve: Curves.easeOutQuint,
                tween: Tween<double>(begin: 15.0, end: 20.0),
                builder: (context, animatorState, child) {
                  // print(animatorState.value);
                  return Column(
                    children: [
                      Text(
                        'RHEMA',
                        style: TextStyle(
                          fontSize: animatorState.value * 3.5,
                          fontFamily: AppConstants.fontfamilypermenent,
                          // color: palete.trueWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'BIBLE QUIZ',
                        style: TextStyle(
                          // color: palete.trueWhite,
                          fontSize: 22,
                          fontFamily: AppConstants.fontfamilypermenent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }
                // Icon(
                //   Icons.keyboard_arrow_down,
                //   size: animatorState.value * 3.5,
                //   color: Colors.white,
                // ),
                ),
          ),
          // Expanded(
          //   child: Transform.rotate(
          //     angle: -0.1,
          //     child: DefaultTextStyle(
          //       textAlign: TextAlign.center,
          //       style: const TextStyle(
          //         fontSize: 55,
          //         height: 1,
          //         fontFamily: AppConstants.fontfamilypermenent,
          //         fontWeight: FontWeight.bold, // Make the text bold
          //         color: Colors.black54,
          //       ),
          //       child: AnimatedTextKit(
          //         animatedTexts: [
          //           TyperAnimatedText('RHEMA BIBLE QUIZ',
          //               textAlign: TextAlign.center,
          //               speed: const Duration(milliseconds: 200)),
          //         ],
          //         displayFullTextOnTap: true,
          //         pause: const Duration(milliseconds: 3000),
          //         isRepeatingAnimation: true,
          //         repeatForever: true,
          //       ),
          //     ),
          //   ),
          // ),
          gap,
          SafeArea(
            top: false,
            maintainBottomViewPadding: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LIstcard(
                      text: "Play Now",
                      onTap: () {
                        audioController.playSfx(SfxType.buttonTap);
                        GoRouter.of(context).go(LevelSelectionScreen.route);
                      }),
                  // TODO: ACHIEVEMNETS,AND LEADERBOARD
                  if (gameServiceController != null) ...[
                    _hideUntilReady(
                      ready: gameServiceController.signedIn,
                      child: Column(
                        children: [
                          _gap,
                          LIstcard(
                              text: "Achievements",
                              onTap: () {
                                gameServiceController.showAchievement();
                              }),
                          _gap
                        ],
                      ),
                    ),
                    _hideUntilReady(
                      ready: gameServiceController.signedIn,
                      child: LIstcard(
                          text: "Leaderboard",
                          onTap: () {
                            gameServiceController.showLeaderboard();
                          }),
                    ),
                  ],
                  _gap,
                  LIstcard(
                      text: "Settings",
                      onTap: () {
                        audioController.playSfx(SfxType.buttonTap);
                        GoRouter.of(context).go(SettingsScreen.route);
                      }),

                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: settingsController.muted,
                      builder: (context, muted, child) {
                        return IconButton(
                          onPressed: () => settingsController.toggleMuted(),
                          icon:
                              Icon(muted ? Icons.volume_off : Icons.volume_up),
                        );
                      },
                    ),
                  ),
                  _gap,
                  Text(audioController.songtitle),
                  _gap,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hideUntilReady({required Future<bool> ready, required Widget child}) {
    return FutureBuilder<bool>(
        future: ready,
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.data ?? false,
            maintainSize: false,
            maintainState: true,
            maintainAnimation: true,
            child: child,
          );
        });
  }
}
