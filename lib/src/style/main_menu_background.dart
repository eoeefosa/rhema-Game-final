import 'package:flutter/material.dart';

class MainMenuBackground extends StatelessWidget {
  const MainMenuBackground({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.brown.withOpacity(0.2), BlendMode.srcOver),
            image: const AssetImage('assets/images/boob.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: child);
  }
}