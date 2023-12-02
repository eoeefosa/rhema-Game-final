import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:rhemabiblequiz/src/audio/audio_controller.dart';
import 'package:rhemabiblequiz/src/audio/sounds.dart';
import 'package:rhemabiblequiz/src/games_services/game_services_controller.dart';
import 'package:rhemabiblequiz/src/level_selection/level_selection_screen.dart';
import 'package:rhemabiblequiz/src/main_menu/list_card.dart';
import 'package:rhemabiblequiz/src/settings/settings.dart';
import 'package:rhemabiblequiz/src/settings/settings_screen.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';
import 'package:rhemabiblequiz/src/style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  /// static const route = '/';
  static const route = '/';
  static const _gap = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    final pallete = context.watch<Palette>();
    // TODO: INITALISE gameservicecontroller
    final gameServiceController = context.watch<GameServicesController?>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    return Scaffold(
      backgroundColor: pallete.backgroundMain,
      body: ResponsiveScreen(
        mainAreaProminence: 0.45,
        squarishMainArea: Center(
          child: Transform.rotate(
            angle: -0.1,
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 55,
                height: 1,
                fontFamily: AppConstants.fontfamilypermenent,
                fontWeight: FontWeight.bold, // Make the text bold
                color: Colors.black54,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('RHEMA BIBLE QUIZ',
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 200)),
                ],
                displayFullTextOnTap: true,
                pause: const Duration(milliseconds: 3000),
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
          ),
        ),
        rectangularMenuArea: Column(
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("hell"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ValueListenableBuilder<bool>(
                valueListenable: settingsController.muted,
                builder: (context, muted, child) {
                  return IconButton(
                    onPressed: () => settingsController.toggleMuted(),
                    icon: Icon(muted ? Icons.volume_off : Icons.volume_up),
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
