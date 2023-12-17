import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/level_selection/components/level_screen_app_icon.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

import '../bible_quiz_game/constants.dart';
import 'player_progress.dart';

class GamePoint extends StatelessWidget {
  const GamePoint({super.key, this.color, this.shape, this.elevation});
  final Color? color;
  final OutlinedBorder? shape;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // return LevelScreenAppBarIcons(
    //   color: Colors.yellow.shade400,
    //   child: Row(
    //     children: [diamond(size: 20), const PointsWidget()],
    //   ),
    // );
    return ElevatedButton(
      onPressed: () {
        context.push('/store');
      },
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: shape,
        backgroundColor: color ?? palette.appbarwidgetbackground,
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      child: Row(
        children: [diamond(size: 20), const PointsWidget()],
      ),
    );
  }
}

class PointsWidget extends StatelessWidget {
  const PointsWidget() : super(key: const Key('GAme point'));

// _animationCo
  @override
  Widget build(BuildContext context) {
    final playerProgress = context.watch<PlayerProgress>();

    int oldpoint = playerProgress.oldpoint;
    int newpoint = playerProgress.points;
//

    return TweenAnimationBuilder<int>(
      key: ValueKey<int>(newpoint),
      onEnd: () => playerProgress.oldpoint = newpoint,
      tween: IntTween(begin: oldpoint, end: newpoint),
      duration: const Duration(milliseconds: 2000),
      builder: (_, int value, child) {
        if (newpoint < oldpoint) {
          value = newpoint;
        }
        return Text(
          value.toString(),
          style: const TextStyle(
            // fontSize: 24.0,
            fontWeight: FontWeight.bold,
            // fontFamily: AppConstants.fontfamilypermenent,
            letterSpacing: 2,
            fontFamily: 'Comic Sans MS', // Use a fun and kid-friendly font
            color: Colors.green, // Choose a fun color
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';

// class PointsWidget extends StatefulWidget {
//   @override
//   _PointsWidgetState createState() => _PointsWidgetState();
// }

// class _PointsWidgetState extends State<PointsWidget> with TickerProviderStateMixin {
//   int _points = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         AnimatedBuilder(
//           animation: _animationController,
//           builder: (context, child) {
//             return Text(
//               'Points: ${(_points * _animationController.value).round()}',
//               style: TextStyle(fontSize: 24),
//             );
//           },
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _startAnimation();
//           },
//           child: Text('Add Points'),
//         ),
//       ],
//     );
//   }
// class _PointsWidgetState extends State<PointsWidget> with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final playerProgress = context.watch<PlayerProgress>();

//     int oldPoint = playerProgress.oldPoint;
//     int newPoint = playerProgress.points;

//     // Check if the points have changed
//     if (oldPoint != newPoint) {
//       _startAnimation(oldPoint, newPoint);
//       playerProgress.oldPoint = newPoint; // Update oldPoint for the next animation
//     }

//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         int currentPoint = (oldPoint + (newPoint - oldPoint) * _animation.value).round();
//         return Text('$currentPoint');
//       },
//     );
//   }

//   void _startAnimation(int oldPoint, int newPoint) {
//     _animationController.reset();
//     _animationController.forward();
//   }
// }
