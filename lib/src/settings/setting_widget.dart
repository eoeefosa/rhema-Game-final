import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../level_selection/components/level_screen_app_icon.dart';
import 'settings_screen.dart';

// class SettingsWidget extends StatelessWidget {
//   const SettingsWidget({super.key, this.width});
//   final double? width;
//   @override
//   Widget build(BuildContext context) {
//     final audioController = context.watch<AudioController>();

//     return Container(
//       decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(16),
//           color: const Color.fromRGBO(227, 210, 182, 1)),
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//       child: InkWell(
//         onTap: () {
//           audioController.playSfx(SfxType.buttonTap);
//           GoRouter.of(context).push(SettingsScreen.route);
//         },
//         child: width == null
//             ? const Row(children: [
//                 Icon(
//                   Icons.settings,
//                 ),
//                 Text("Setting")
//               ])
//             : const Row(children: [
//                 Icon(
//                   Icons.settings,
//                   // size: width! * .2,
//                 ),
//                 Text(
//                   "Setting",
//                   // style: TextStyle(fontSize: width! * .1),
//                 )
//               ]),
//       ),
//     );
//   }
// }

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    final audioController = context.watch<AudioController>();
    final palette = context.watch<Palette>();
    return LevelScreenAppBarIcons(
      onTap: () {
        audioController.playSfx(SfxType.buttonTap);
        GoRouter.of(context).push(SettingsScreen.route);
      },
      child: width == null
          ? const Row(children: [
              Icon(
                Icons.settings,
              ),
              Text("Setting")
            ])
          : Row(children: [
              Icon(
                Icons.settings,
                color: palette.darkPen,
              ),
              Text(
                "Setting",
                style: TextStyle(color: palette.darkPen),
              )
            ]),
    );
  }
}
