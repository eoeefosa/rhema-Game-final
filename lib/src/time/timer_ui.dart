import 'package:circular_progress_bar_with_lines/circular_progress_bar_with_lines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

class TimerUi extends StatelessWidget {
  final int currentSeconds;
  final int totalSeconds;

  const TimerUi(
      {super.key, required this.currentSeconds, required this.totalSeconds});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.artipapercolor,
      ),
      child: CircularProgressBarWithLines(
        linesAmount: 20,
        linesColor: Colors.red.shade900,
        linesWidth: 3,
        linesLength: 5,
        radius: currentSeconds < 10 ? 20 : 18,
        percent: 100 - 100 * (currentSeconds / totalSeconds),
        centerWidgetBuilder: (context) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [palette.artipapercolor, Colors.red.shade900],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Text(
              currentSeconds < 10 ? ' $currentSeconds ' : '$currentSeconds',
              style: TextStyle(
                color: palette.trueWhite,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comic Sans MS', // Use a fun and kid-friendly font
                // color: Colors.green, // Choose a fun color
              ),
            ),
          );
        },
      ),
    );
  }
}
