import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/constants.dart';

const Color widgetcolor = Color.fromARGB(255, 134, 73, 3);
const Color contextColor = Colors.white;
const OutlinedBorder shape = CircleBorder();

class ButtomOptions extends StatelessWidget {
  const ButtomOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// pause the game
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => SimpleDialog(
                      title: const Text('Dialog Title'),
                      children: [
                        const SimpleDialogOption(
                          child: Text("continue"),
                        ),
                        const SimpleDialogOption(
                          child: Text("continue"),
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Quit"))
                          ],
                        )
                      ],
                    ));
          },
          style: ElevatedButton.styleFrom(
              surfaceTintColor: widgetcolor,
              foregroundColor: widgetcolor,
              backgroundColor: widgetcolor,
              shape: shape),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.pause,
              // size: 30,
              color: contextColor,
            ),
          ),
        ),

        /// Add Time
        CustomGameIcon(
          onPressed: () {},
          buttomtext: const Text(
            "x2",
            style: TextStyle(color: contextColor),
          ),
          icon: const Icon(
            Icons.more_time,
            color: contextColor,
          ),
        ),

        /// Add clear wrong option
        CustomGameIcon(
          onPressed: () {
            // TODO: FIX QUIT

            Navigator.of(context).pop();
          },
          buttomtext: const Text(
            "x2",
            style: TextStyle(color: contextColor),
          ),
          icon: const Icon(
            Icons.cleaning_services_rounded,
            color: contextColor,
          ),
        ),

        /// hint
        CustomGameIcon(
          onPressed: () {},
          buttomtext: const Text(
            "x2",
            style: TextStyle(color: contextColor),
          ),
          icon: const RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.wb_incandescent_rounded,
                color: contextColor,
              )),
        ),

        /// Watch ads
        CustomGameIcon(
          buttomtext: Row(
            children: [
              const Text(
                "+50",
                style: TextStyle(color: contextColor),
              ),
              diamond(),
            ],
          ),
          icon: const Icon(
            Icons.video_collection,
            color: contextColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class CustomGameIcon extends StatelessWidget {
  const CustomGameIcon({
    super.key,
    required this.icon,
    required this.buttomtext,
    required this.onPressed,
  });

  final Widget icon;
  final Widget buttomtext;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widgetcolor,
          surfaceTintColor: widgetcolor,
          foregroundColor: widgetcolor,
          alignment: Alignment.center,
          shape: const CircleBorder(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            children: [
              icon,
              buttomtext,
            ],
          ),
        ),
      ),
    );
  }
}
