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
import '../style/main_menu_background.dart';
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
      body: MainMenuBackground(
        child: Column(
          children: [
            gap,
            AppBarWidget(width: size.width * 0.8, mainscreen: true),
            gap,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: settingsController.muted,
                    builder: (context, muted, child) {
                      return IconButton(
                        onPressed: () => settingsController.toggleMuted(),
                        icon: Icon(muted ? Icons.volume_off : Icons.volume_up),
                      );
                    },
                  ),
                  // _gap,
                  // Text(audioController.songtitle),
                ],
              ),
            ),

            const SizedBox(
              width: double.infinity,
              height: 150,
              child: Column(
                children: [
                  Text(
                    'RHEMA',
                    style: TextStyle(
                      fontSize: 55,
                      fontFamily: AppConstants.fontfamilypermenent,
                      // color: palete.trueWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'BIBLE QUIZ',
                    style: TextStyle(
                      // color: palete.trueWhite,
                      fontSize: 22,
                      fontFamily: AppConstants.fontfamilypermenent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
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
                        text: "Quit",
                        onTap: () {
                          audioController.playSfx(SfxType.buttonTap);
                          GoRouter.of(context).go(SettingsScreen.route);
                        }),

                    _gap,
                  ],
                ),
              ),
            ),
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
