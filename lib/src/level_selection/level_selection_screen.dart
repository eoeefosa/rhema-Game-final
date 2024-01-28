import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rhemabiblequiz/src/audio/audio_controller.dart';
import 'package:rhemabiblequiz/src/audio/sounds.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';
import 'package:rhemabiblequiz/src/commons/appBar.dart';
import 'package:rhemabiblequiz/src/level_selection/provider/levelbook.dart';
import 'package:rhemabiblequiz/src/player_progress/player_progress.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';
import 'components/level_card.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  /// static const routename = 'play';
  static const routename = 'play';
  static const route = '/play';

  @override
  Widget build(BuildContext context) {
    final pallette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();
    final questions = context.watch<Questions>();
    final size = MediaQuery.of(context).size;
    const gap = SizedBox(height: 8);
    final levelbook = context.watch<LevelBook>();

    return Scaffold(
      backgroundColor: pallette.backgroundLevelSelection,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wood.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -30,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * .15,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/flower.png"),

                      //
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    gap,
                    AppBarWidget(
                      width: size.width * .8,
                    ),
                    gap,
                    gap,
                    gap,
                    Container(
                      height: size.height * .8,
                      // width: size.width * .8,
                      width: size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(149, 125, 103, 1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/boob.png'),
                          // colorFilter: ColorFilter.linearToSrgbGamma(),
                          colorFilter: ColorFilter.srgbToLinearGamma(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: levelbook.thereIspreviousbook
                                      ? () {
                                          levelbook.getpreviousbook();
                                        }
                                      : null,
                                  child: Text(levelbook.previousTitle)),
                              TextButton(
                                  onPressed: levelbook.thereIsnextBook
                                      ? () {
                                          levelbook.getnextbook();
                                        }
                                      : null,
                                  child: Text(
                                    levelbook.nextTitle,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Center(
                                child: Text(
                                  levelbook.currentTitle,
                                  style: const TextStyle(
                                    fontFamily:
                                        AppConstants.fontfamilypermenent,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(height: 0),
                          Expanded(
                            child: ListView(
                              children: [
                                GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 11,
                                    itemBuilder: (BuildContext context, index) {
                                      // final playerprogress = context.watch<PlayerProgress>();
                                      return LevelCard(
                                        level: (index + 1) +
                                            (levelbook.currentbook * 11),
                                        stars: playerProgress.ratingsperBook(
                                            levelbook.currentTitle)[index],
                                        isOpen: (index + 1) +
                                                (levelbook.currentbook * 11) <=
                                            playerProgress.highestLevelReached +
                                                1,
                                        onpressed: () {
                                          questions.chooseLevel(index);
                                          final audioController =
                                              context.read<AudioController>();
                                          audioController
                                              .playSfx(SfxType.buttonTap);
                                          GoRouter.of(context).go(
                                              '/play/quiz_game',
                                              extra: {'level': (index)});
                                        },
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
