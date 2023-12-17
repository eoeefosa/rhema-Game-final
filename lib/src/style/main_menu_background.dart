import 'package:flutter/material.dart';

class MainMenuBackground extends StatelessWidget {
  const MainMenuBackground({super.key, this.child, this.color});
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                color != null ? color! : Colors.brown.withOpacity(0.2),
                BlendMode.srcOver),
            // colorFilter: ,
            image: const AssetImage('assets/images/boob.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: child);
  }
}
