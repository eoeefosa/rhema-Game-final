import 'package:flutter/material.dart';

class LevelScreenAppBarIcons extends StatelessWidget {
  const LevelScreenAppBarIcons({
    super.key,
    this.child,
    this.onTap,
  });

  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromRGBO(227, 210, 182, 1)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
