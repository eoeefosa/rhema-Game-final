import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/constants.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/model/question_model.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/widgets/level_card.dart';
import 'package:rhemabiblequiz/src/player_progress/gamepoints_widget.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';
import 'package:rhemabiblequiz/src/time/timer_ui.dart';

import '../../level_selection/components/level_screen_app_icon.dart';
import '../provider/questions.dart';

class Titlebar extends StatefulWidget {
  const Titlebar({
    super.key,
    required this.leveldifficulty,
    required this.maxStar,
    required this.score,
    required this.life,
    required this.totalseconds,
    required this.currentseconds,
    required this.height,
    required this.width,
  });
  // TODO: FIX THE ISSUE
  final String leveldifficulty;
  final int maxStar;
  final int score;
  final int life;
  final int totalseconds;
  final int currentseconds;
  final double height;
  final double width;

  @override
  State<Titlebar> createState() => _TitlebarState();
}

class _TitlebarState extends State<Titlebar> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final question = context.watch<Questions>();
    return SizedBox(
      height: widget.height,
      // width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 16,
          ),
          LevelScreenAppBarIcons(
            child: Row(
              children: [
                Icon(
                  Icons.ac_unit_rounded,
                  color: Colors.yellow.shade900,
                  size: 20,
                ),
                Text(
                  widget.leveldifficulty,
                  style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold,
                    fontFamily:
                        'Comic Sans MS', // Use a fun and kid-friendly font
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // CircularProgressIndicator(
          //   backgroundColor: Colors.white,
          //   color: (widget.currentseconds) < widget.totalseconds / 6
          //       ? Colors.green[800]
          //       : (widget.currentseconds) < widget.totalseconds / 3
          //           ? Colors.yellow[800]
          //           : Colors.red[800],
          //   strokeWidth: 6.0,
          //   value: widget.currentseconds / widget.totalseconds,
          //   strokeCap: StrokeCap.round,
          // ),

          TimerUi(
            currentSeconds: question.seconds,
            totalSeconds: question.totalseconds,
          ),

          const Spacer(),
          const GamePoint(),
          // Row(
          //   children: List.generate(
          //     3,
          //     (index) => Container(
          //         decoration: BoxDecoration(
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black.withOpacity(0.2),
          //               blurRadius: 6,
          //               offset: const Offset(0, 3),
          //             ),
          //           ],
          //         ),
          //         child: ShaderMask(
          //           shaderCallback: (Rect bounds) {
          //             return stargradient.createShader(bounds);
          //           },
          //           blendMode: BlendMode.srcIn,
          //           child: const Icon(
          //             Icons.star_rate_rounded,
          //             size: 30,
          //             color: Colors.white,
          //           ),
          //         )),
          //   ),
          // )
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
