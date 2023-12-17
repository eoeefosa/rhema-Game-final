// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:rhemabiblequiz/src/settings/setting_widget.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';

import '../player_progress/gamepoints_widget.dart';
import '../style/constants.dart';

class AppBarWidget extends StatefulWidget {
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
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final iconSize = widget.width / 5;
    final palette = context.watch<Palette>();

    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        //   children: widget.mainscreen
        //       ? [
        //           const SettingsWidget(),
        //           const Spacer(),
        //           const GamePoint(),
        //         ]
        //       : [
        //           ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //               padding: const EdgeInsets.symmetric(horizontal: 10),
        //             ),
        //             onPressed: () {
        //               context.pop();
        //             },
        //             child: Row(
        //                 mainAxisSize: MainAxisSize.min,
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     '<',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 20,
        //                       // letterSpacing: 2,
        //                       fontFamily: 'Comic Sans MS',
        //                       // fontFamily: AppConstants.fontfamilypermenent,
        //                       color: palette.inkFullOpacity,
        //                     ),
        //                     textAlign: TextAlign.center,
        //                   ),
        //                 ]),
        //           ),
        //         ],
        // )
        children: widget.mainscreen == true
            ? [
                const SettingsWidget(),
                const Spacer(),
                const GamePoint(),
              ]
            : [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // fixedSize: Size.fromWidth(iconSize),
                    // elevation: 8.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    backgroundColor: palette.appbarwidgetbackground,
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
//
                    // backgroundColor: const Color.fromRGBO(227, 210, 182, 1),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: iconSize * .3,
                    // fill: 1,
                    color: palette.inkFullOpacity,
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
