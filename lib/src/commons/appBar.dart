// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rhemabiblequiz/src/settings/setting_widget.dart';

import '../player_progress/gamepoints_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.width,
    this.heigth,
    this.mainscreen = false,
  }) : super(key: key);
  final double width;
  final double? heigth;
  final bool mainscreen;

  @override
  Widget build(BuildContext context) {
    final iconSize = width / 5;
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: mainscreen
            ? [
                const SettingsWidget(),
                const Spacer(),
                const GamePoint(),
              ]
            : [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(iconSize),
                      elevation: 8.0,
                      backgroundColor: const Color.fromRGBO(227, 210, 182, 1)),
                  onPressed: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: iconSize * .3,
                  ),
                ),
                const Spacer(),
                const GamePoint(),
                const Spacer(),
                SettingsWidget(width: iconSize),
              ],
      ),
    );
  }
}
