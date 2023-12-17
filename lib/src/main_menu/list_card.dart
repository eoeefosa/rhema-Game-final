import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

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
    final width = MediaQuery.of(context).size.width;
    final palette = context.watch<Palette>();

    return TextButton(
      onPressed: onTap,
      // style: ElevatedButton.styleFrom(
      //   fixedSize: Size.fromWidth(width * .8),
      //   backgroundColor: Colors.yellow.shade300,
      //   shape: const StadiumBorder(),
      //   // textStyle: TextStyle(
      //   //   fontWeight: FontWeight.bold,
      //   //   fontSize: 30,
      //   //   letterSpacing: 2,
      //   //   // fontFamily: 'Comic Sans MS',
      //   //   fontFamily: AppConstants.fontfamilypermenent,
      //   //   color: palette.inkFullOpacity,
      //   // ),
      // ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          letterSpacing: 2,
          // fontFamily: 'Comic Sans MS',
          fontFamily: AppConstants.fontfamilypermenent,
          color: palette.inkFullOpacity,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _LIstcard extends StatelessWidget {
  const _LIstcard({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
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
              palette.artipapercolor,
              Colors.brown.shade900,
              // Colors.green.withOpacity(.8),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            containercontent: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
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
