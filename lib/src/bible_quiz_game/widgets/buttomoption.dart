import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/constants.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/model/question_model.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';
import 'package:rhemabiblequiz/src/settings/settings.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

import '../../level_selection/level_selection_screen.dart';

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
    final settings = context.watch<SettingsController>();

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
                            // contentPadding: const EdgeInsets.symmetric(
                            // horizontal: 30, vertical: 50),
                            title: ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: pallette.artipapercolor,
                                foregroundColor: pallette.artipapercolor,
                                surfaceTintColor: pallette.artipapercolor,
                                disabledBackgroundColor:
                                    pallette.artipapercolor,
                                disabledForegroundColor:
                                    pallette.artipapercolor,
                              ),
                              child: Text('GAME PAUSED',
                                  style: TextStyle(
                                    color: pallette.ink,
                                    fontFamily:
                                        AppConstants.fontfamilyLuckiestgut,
                                    letterSpacing: 2,
                                  )),
                            ),
                            surfaceTintColor: pallette.background4,
                            backgroundColor: pallette.artipapercolor,
                            children: [
                              Column(
                                children: [
                                  const Text(''),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: settings.soundsOn,
                                    builder: (context, soundOn, child) =>
                                        _SettingsLine(
                                      soundOn
                                          ? 'Game Sound ON'
                                          : 'Game Sound OFF',
                                      Icon(soundOn
                                          ? Icons.graphic_eq
                                          : Icons.volume_off),
                                      onSelected: () =>
                                          settings.toggleSoundsOn(),
                                    ),
                                  ),
                                  const Text(''),
                                  ValueListenableBuilder(
                                    valueListenable: settings.musicOn,
                                    builder: (context, musicOn, child) =>
                                        _SettingsLine(
                                      musicOn ? 'Music ON' : 'Music OFF',
                                      Icon(musicOn
                                          ? Icons.music_note
                                          : Icons.music_off),
                                      onSelected: () =>
                                          settings.toggleMusicOn(),
                                    ),
                                  ),
                                  
                                  const Text(''),
                                  _SettingsLine(
                                    'RESTART GAME',
                                    Icon(
                                      Icons.restore_sharp,
                                      color: Colors.red[900],
                                    ),
                                    onSelected: () {
                                      context.read<Questions>().rePlayLevel();
                                      context.pop();
                                    },
                                    color: Colors.red[900],
                                  ),
                                  const Text(''),
                                  const Text(''),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        GoRouter.of(context)
                                            .go('/play/score_screen');
                                        Navigator.of(context).pop();

                                        // GoRouter.of(context).go(, extra: {'score': score});
                                      },
                                      child: Text("Quit Game",
                                          style: TextStyle(
                                            // fontWeight: FontWeight.w200,
                                            color: pallette.redPen,
                                            fontFamily: AppConstants
                                                .fontfamilyLuckiestgut,
                                            letterSpacing: 1,
                                          ))),
                                  // const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            pallette.artipapercolor,
                                        elevation: 8,
                                      ),
                                      child: Text("Continue Game",
                                          style: TextStyle(
                                            color: pallette.darkPen,
                                            fontFamily: AppConstants
                                                .fontfamilyLuckiestgut,
                                            letterSpacing: 1,
                                          ))),
                                ],
                              )
                            ],
                          ));
                },
              ),
              gap,
              const Text(""),
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

class _SettingsLine extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function()? onSelected;
  // ignore: unused_element
  const _SettingsLine(this.title, this.icon, {this.onSelected, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: InkResponse(
        highlightShape: BoxShape.rectangle,
        onTap: onSelected,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            Text(
              title,
              style: color == null
                  ? const TextStyle(
                      fontFamily: AppConstants.fontfamilyLuckiestgut,
                      letterSpacing: 2,
                    )
                  : TextStyle(
                      color: color,
                      fontFamily: AppConstants.fontfamilyLuckiestgut,
                      letterSpacing: 2,
                    ),
            ),
            const Spacer(),
            icon,
          ]),
        ),
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
