import 'package:flutter/material.dart';

class LIstcard extends StatelessWidget {
  const LIstcard({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: onTap,
          child: AssetsContainer(
            imageAssets: "assets/images/boob.png",
            foregroundgradient: LinearGradient(colors: [
              Colors.yellow.withOpacity(.5),
              Colors.green.withOpacity(.5),
              Colors.green.withOpacity(.8),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            containercontent: Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AssetsContainer extends StatelessWidget {
  const AssetsContainer({
    super.key,
    required this.imageAssets,
    required this.containercontent,
    required this.foregroundgradient,
  });
  final String imageAssets;
  final Widget containercontent;
  final Gradient foregroundgradient;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imageAssets),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: foregroundgradient,
          ),
          width: width * .8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8.0),
            child: Center(
              child: containercontent,
            ),
          ),
        )
      ],
    );
  }
}
