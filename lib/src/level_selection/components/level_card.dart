import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

import '../../style/constants.dart';

class LevelCard extends StatelessWidget {
  const LevelCard(
      {super.key,
      required this.level,
      required this.stars,
      required this.isOpen,
      required this.onpressed});

  final int level;
  final int stars;
  final bool isOpen;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      const Color.fromRGBO(85, 107, 47, 1),
      const Color.fromRGBO(139, 69, 19, 1),
      const Color.fromRGBO(47, 79, 79, 1),
      const Color.fromRGBO(160, 82, 45, 1),
      const Color.fromRGBO(218, 165, 32, 1),
      const Color.fromRGBO(189, 183, 107, 1),
      const Color.fromRGBO(188, 143, 143, 1),
      const Color.fromRGBO(184, 134, 11, 1),
      const Color.fromRGBO(205, 133, 63, 1)

      // Colors.red,
      // // Color.fromRGBO(184, 143, 93, 1)
      // Colors.redAccent,
      // Colors.green,
      // Colors.greenAccent,
      // Colors.amber,
      // Colors.blue,
      // Colors.blueAccent,
      // Colors.purple,
      // Colors.purpleAccent,
    ];
    final random = Random().nextInt(8);
    final palette = context.watch<Palette>();
    return SizedBox(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Star(top: 14, isFull: stars > 0, isOpen: isOpen),
              Star(
                isFull: stars > 1,
                isOpen: isOpen,
              ),
              Star(top: 14, isFull: stars > 2, isOpen: isOpen),
            ],
          ),
          InkWell(
              onTap: isOpen ? onpressed : null,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        colors[random].withOpacity(isOpen ? 1 : .2),
                        BlendMode.modulate,
                      ),
                      child: Image.asset('assets/images/level.png'),
                    ),
                    Text(
                      'Level \n $level',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: Colors.yellow.withOpacity(isOpen ? 1 : .2),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 2,
                        fontFamily: 'Comic Sans MS',
                        // fontFamily: AppConstants.fontfamilypermenent,
                        color: isOpen ? palette.leveltext : palette.levelfaded,
                      ),
                    ),
                    if (!isOpen)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Icon(
                          Icons.lock,
                          color: palette.levelIcon,
                        ),
                      )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Star extends StatelessWidget {
  const Star({
    super.key,
    this.top = 0,
    required this.isFull,
    required this.isOpen,
  });
  final double top;
  final bool isFull;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: top),
      child: Icon(
        isFull ? Icons.star_rounded : Icons.star_outline_rounded,
        // color: Colors.yellow.withOpacity(isOpen ? .9 : .5),
        color: isOpen ? Colors.yellow.shade500 : Colors.yellow.withOpacity(.2),
      ),
    );
  }
}
