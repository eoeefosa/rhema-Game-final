import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/level_selection/components/level_screen_app_icon.dart';

import '../bible_quiz_game/constants.dart';
import 'player_progress.dart';

class GamePoint extends StatelessWidget {
  const GamePoint({super.key});

  @override
  Widget build(BuildContext context) {
    return LevelScreenAppBarIcons(
      child: Row(
        children: [diamond(size: 20), const PointsWidget()],
      ),
    );
    // return ElevatedButton.icon(
    //   onPressed: () {},
    //   style: ElevatedButton.styleFrom(
    //       elevation: 8.0,
    //       backgroundColor: const Color.fromRGBO(227, 210, 182, 1)),
    //   icon: diamond(size: 20),
    //   label: Text("${playerProgress.points}"),
    // );
  }
}

class PointsWidget extends StatefulWidget {
  const PointsWidget({
    super.key,
  });

  @override
  State<PointsWidget> createState() => _PointsWidgetState();
}

class _PointsWidgetState extends State<PointsWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

// _animationCo
  @override
  Widget build(BuildContext context) {
    final playerProgress = context.watch<PlayerProgress>();

    int oldpoint = playerProgress.oldpoint;
    int newpoint = playerProgress.points;
// Check if the points have changed
    if (oldpoint != newpoint) {
      _startAnimation(oldpoint, newpoint);
      playerProgress.oldpoint =
          newpoint; // Update oldPoint for the next animation
    }

    return ListenableBuilder(
        listenable: playerProgress.pointchange,
        builder: (context, child) {
          return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                int currentPoint = (playerProgress.oldpoint +
                        (playerProgress.points - playerProgress.oldpoint) *
                            _animation.value)
                    .round();

                return Text("${playerProgress.points}");
              });
        });
  }

  void _startAnimation(int oldPoint, int newPoint) {
    _animationController.reset();
    _animationController.forward();
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
