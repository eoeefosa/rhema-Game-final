import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/games_services/score.dart';
import 'package:rhemabiblequiz/src/level_selection/level_selection_screen.dart';
import 'package:rhemabiblequiz/src/main_menu/main_menu_screen.dart';
import 'package:rhemabiblequiz/src/settings/settings_screen.dart';
import 'package:rhemabiblequiz/src/style/my_transition.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';
import 'package:rhemabiblequiz/src/win_game/win_game_screen.dart';

import 'src/bible_quiz_game/view/quiz_screen.dart';

class AppRoutes {
  static final routes = GoRouter(
    routes: [
      GoRoute(
          path: MainMenuScreen.route,
          builder: (context, state) {
            return const MainMenuScreen(key: Key('main menu'));
          },
          routes: [
            GoRoute(
                path: LevelSelectionScreen.routename,
                pageBuilder: (context, state) => buildMyTransition(
                      child: const LevelSelectionScreen(
                        key: Key('level selection'),
                      ),
                      color: context.watch<Palette>().backgroundLevelSelection,
                    ),
                routes: [
                  GoRoute(
                      path: 'quiz_game',
                      pageBuilder: (context, state) => buildMyTransition(
                            child: const QuizScreen(),
                            color:
                                context.watch<Palette>().backgroundPlaySession,
                          )),
                  GoRoute(
                      path: 'won_quiz',
                      pageBuilder: (context, state) {
                        final map = state.extra! as Map<String, dynamic>;
                        final score = map['score'] as int;
                        return buildMyTransition(
                          child: WinGameScreen(
                            scorenumber: score,
                            key: const Key('win game'),
                          ),
                          color: context.watch<Palette>().backgroundPlaySession,
                        );
                      }),
                  GoRoute(
                      path: 'won',
                      pageBuilder: (context, state) {
                        final map = state.extra! as Map<String, dynamic>;
                        final score = map['score'] as Score;
                        return buildMyTransition(
                          child: WinGameScreen(
                            score: score,
                            key: const Key('win game'),
                          ),
                          color: context.watch<Palette>().backgroundPlaySession,
                        );
                      })
                ]),
            GoRoute(
              path: SettingsScreen.routename,
              builder: (context, state) => const SettingsScreen(
                key: Key('settings'),
              ),
            )
          ]),
    ],
  );
}
