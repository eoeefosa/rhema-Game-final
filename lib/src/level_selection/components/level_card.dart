import 'dart:math';

import 'package:flutter/material.dart';

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
      Colors.red,
      Colors.redAccent,
      Colors.green,
      Colors.greenAccent,
      Colors.amber,
      Colors.blue,
      Colors.blueAccent,
      Colors.purple,
      Colors.purpleAccent,
    ];
    final random = Random().nextInt(8);
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
                        colors[random].withOpacity(isOpen ? .9 : .2),
                        BlendMode.modulate,
                      ),
                      child: Image.asset('assets/images/level.png'),
                    ),
                    Text(
                      'Level \n $level',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue.withOpacity(isOpen ? .9 : .2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (!isOpen)
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          Icons.lock,
                          color: Colors.amber,
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
        color: Colors.amber.withOpacity(isOpen ? .9 : .5),
      ),
    );
  }
}
