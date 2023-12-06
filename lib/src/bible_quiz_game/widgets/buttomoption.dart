import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

const Color widgetcolor = Color.fromARGB(255, 134, 73, 3);
const Color contextColor = Colors.white;
const OutlinedBorder shape = CircleBorder();

class ButtomOptions extends StatelessWidget {
  const ButtomOptions({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    final iconPadding = width / 100;
    final widgetsize = width / 10;
    final iconSize = (widgetsize - iconPadding) * 0.8;
    final gap = SizedBox(width: width / 100);
    final pallette = context.watch<Palette>();

    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// pause the game
          Column(
            children: [
              MyCustomElevatedButton(
                widgetsize: widgetsize,
                iconPadding: iconPadding,
                child: Icon(
                  Icons.pause,
                  size: iconSize,
                  color: contextColor,
                ),
                onTap: () {
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
              ),
              gap,
              Text(
                "",
                style: TextStyle(color: pallette.pen),
              ),
            ],
          ),
          const Spacer(),

          /// Add Time
          Column(
            children: [
              MyCustomElevatedButton(
                widgetsize: widgetsize,
                iconPadding: iconPadding,
                child: Icon(
                  Icons.more_time,
                  color: contextColor,
                  size: iconSize,
                ),
              ),
              gap,
              Text(
                "x2",
                style: TextStyle(color: pallette.pen),
              ),
            ],
          ),
          const Spacer(),

          /// Add clear wrong option

          Column(
            children: [
              MyCustomElevatedButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                widgetsize: widgetsize,
                iconPadding: iconPadding,
                child: Icon(
                  Icons.cleaning_services_rounded,
                  color: contextColor,
                  size: iconSize,
                ),
              ),
              gap,
              Text(
                "x2",
                style: TextStyle(color: pallette.pen),
              ),
            ],
          ),

          // CustomGameIcon(
          //   onPressed: () {
          //     // TODO: FIX QUIT

          //     Navigator.of(context).pop();
          //   },
          //   buttomtext: const Text(
          //     "x2",
          //     style: TextStyle(color: contextColor),
          //   ),
          //   icon:
          // ),
          const Spacer(),

          /// hint
          Column(
            children: [
              MyCustomElevatedButton(
                widgetsize: widgetsize,
                iconPadding: iconPadding,
                child: RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.wb_incandescent_rounded,
                      color: contextColor,
                      size: iconSize,
                    )),
              ),
              gap,
              Text(
                "x2",
                style: TextStyle(color: pallette.pen),
              ),
            ],
          ),

          const Spacer(),

          /// Watch ads
          Column(
            children: [
              MyCustomElevatedButton(
                widgetsize: widgetsize,
                iconPadding: iconPadding,
                child: Icon(
                  Icons.video_collection,
                  color: contextColor,
                  size: iconSize,
                ),
              ),
              gap,
              Row(
                children: [
                  Text(
                    "+50",
                    style: TextStyle(color: pallette.pen),
                  ),
                  diamond(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyCustomElevatedButton extends StatelessWidget {
  const MyCustomElevatedButton({
    super.key,
    required this.widgetsize,
    required this.iconPadding,
    this.onTap,
    required this.child,
  });

  final double widgetsize;
  final double iconPadding;
  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: widgetcolor),
      width: widgetsize,
      height: widgetsize,
      padding: EdgeInsets.all(iconPadding),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
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
