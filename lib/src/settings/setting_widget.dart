import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import 'settings_screen.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = context.watch<AudioController>();

    return ElevatedButton.icon(
      onPressed: () {
        audioController.playSfx(SfxType.buttonTap);
        GoRouter.of(context).push(SettingsScreen.route);
      },
      style: ElevatedButton.styleFrom(
        // fixedSize: ,
          elevation: 8.0,
          backgroundColor: const Color.fromRGBO(227, 210, 182, 1)),
      icon: const Icon(Icons.settings),
      label: const Text(
        "Setting",
      ),
    );
  }
}
