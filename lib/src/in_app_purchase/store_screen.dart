import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/constants.dart';
import 'package:rhemabiblequiz/src/style/main_menu_background.dart';

import '../commons/appBar.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarWidget(width: width * 0.8),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  // height: size.height * .3,
                  width: width * .6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(149, 125, 103, 1),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/boob.png'),
                      colorFilter: ColorFilter.linearToSrgbGamma(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Icon(Icons.timer_sharp),
                          Text('+10'),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text('Buy Time'),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                diamond(),
                                const Text('1000'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text('Buy now'),
                        onPressed: () {},
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
