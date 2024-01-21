import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/constants.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';

import '../commons/appBar.dart';
import '../player_progress/player_progress.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final questions = context.watch<Questions>();
    final playerProgress = context.watch<PlayerProgress>();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarWidget(width: width * 0.8),
            const SizedBox(
              height: 8,
            ),
            StoreCard(
              icon: const Icon(Icons.timer_sharp),
              width: width,
              title: "Buy Time",
              onPressed: () {
                if (playerProgress.points > 100) {
                  questions.buyTime(10);
                  playerProgress.usedpoint(100);
                  final messegenger = ScaffoldMessenger.of(context);
                  messegenger.showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                            "Congrates you have succesfully purchased 10  ADDTIME CheatCard. You currently have ${questions.addTimerValue} ADDTIME CheatCard")),
                  );
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            StoreCard(
                icon: const Icon(Icons.h_mobiledata),
                width: width,
                onPressed: () {
                  if (playerProgress.points > 100) {
                    questions.buyHint(10);
                    playerProgress.usedpoint(100);
                    final messegenger = ScaffoldMessenger.of(context);
                    messegenger.showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                              "Congrates you have succesfully purchased 10  HINT CheatCard. You currently have ${questions.hint} HINT CheatCard ")),
                    );
                  }
                },
                title: "Buy Hint"),
            const SizedBox(
              height: 8,
            ),
            StoreCard(
              icon: const Icon(Icons.change_circle),
              width: width,
              title: "Buy 50/50",
              onPressed: () {
                if (playerProgress.points > 100) {
                  questions.buyclearWrongValue(10);
                  playerProgress.usedpoint(100);
                  final messegenger = ScaffoldMessenger.of(context);
                  messegenger.showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                            "Congrates you have succesfully purchased 10  50/50 CheatCard.You currently have ${questions.clearWrongValue} 50/50 CheatCard")),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.width,
    required this.title,
    this.onPressed,
    required this.icon,
  });

  final double width;
  final String title;
  final Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Column(
                children: [
                  icon,
                  const Text('+10'),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(title),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: onPressed,
                child: const Text('Buy now'),
              )
            ],
          )),
    );
  }
}
