import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/commons/appBar.dart';
import 'package:rhemabiblequiz/src/settings/cutom_name_dialog.dart';
import 'package:rhemabiblequiz/src/settings/settings.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

import '../player_progress/gamepoints_widget.dart';
import '../player_progress/player_progress.dart';
import '../style/main_menu_background.dart';

String capitalizeFirstLetter(String word) {
  if (word.isEmpty) {
    return word; // Return the unchanged word if it's empty
  }
  return word[0].toUpperCase() + word.substring(1).toLowerCase();
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  /// for pages
  static const route = '/settings';

  /// for gorouter
  static const routename = 'settings';

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final palette = context.watch<Palette>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainMenuBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              // AppBarWidget(width: size.width * .8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GamePoint(),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              // ),
              _gap,
              const Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppConstants.fontfamilypermenent,
                  fontSize: 55,
                  height: 1,
                ),
              ),
              _gap,
              const _NameChangeLine('Name'),
              ValueListenableBuilder<bool>(
                valueListenable: settings.soundsOn,
                builder: (context, soundOn, child) => _SettingsLine(
                  'Sound Fx',
                  Icon(soundOn ? Icons.graphic_eq : Icons.volume_off),
                  onSelected: () => settings.toggleSoundsOn(),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: settings.musicOn,
                builder: (context, musicOn, child) => _SettingsLine(
                  'Music',
                  Icon(musicOn ? Icons.music_note : Icons.music_off),
                  onSelected: () => settings.toggleMusicOn(),
                ),
              ),
              _gap,
              _SettingsLine(
                "Reset progress",
                const Icon(Icons.delete),
                onSelected: () {
                  context.read<PlayerProgress>().reset();
                  final messegenger = ScaffoldMessenger.of(context);
                  messegenger.showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            "${capitalizeFirstLetter(settings.playerName.value)}  your game reset was successfull.")),
                  );
                },
              ),
              _gap,
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NameChangeLine extends StatelessWidget {
  final String title;

  const _NameChangeLine(this.title);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: () => showCustomNameDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Text(title),
          const Spacer(),
          ValueListenableBuilder(
            valueListenable: settings.playerName,
            builder: (context, name, child) => Text(name),
          ),
        ]),
      ),
    );
  }
}

class _SettingsLine extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function()? onSelected;
  // ignore: unused_element
  const _SettingsLine(this.title, this.icon, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Text(title),
          const Spacer(),
          icon,
        ]),
      ),
    );
  }
}
