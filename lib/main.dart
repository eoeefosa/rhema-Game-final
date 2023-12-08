// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
// import 'package:rhemabiblequiz/firebase_options.dart';
import 'package:rhemabiblequiz/routes.dart';
import 'package:rhemabiblequiz/src/ads/ad_controller.dart';
import 'package:rhemabiblequiz/src/app_lifecycle/app_lifecycle.dart';
import 'package:rhemabiblequiz/src/audio/audio_controller.dart';
import 'package:rhemabiblequiz/src/games_services/game_services_controller.dart';
import 'package:rhemabiblequiz/src/games_services/persistence/sharepref_impl.dart';
import 'package:rhemabiblequiz/src/level_selection/provider/levelbook.dart';
import 'package:rhemabiblequiz/src/player_progress/persistence/local_storage_persistence.dart';
import 'package:rhemabiblequiz/src/player_progress/player_progress.dart';
// import 'package:rhemabiblequiz/src/carashlytics/crashlytics.dart';
import 'package:rhemabiblequiz/src/settings/persistence/local_storage_settings_persistences.dart';
import 'package:rhemabiblequiz/src/settings/persistence/settings_persistence.dart';
import 'package:rhemabiblequiz/src/settings/settings.dart';
import 'package:rhemabiblequiz/src/store/provider/store_controller.dart';
import 'package:rhemabiblequiz/src/style/palette.dart';
import 'package:rhemabiblequiz/src/style/snack_bar.dart';

import 'src/bible_quiz_game/provider/questions.dart';

// Future<void> main() async {
// FirebaseCrashlytics? crashlytics;
// if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     crashlytics = FirebaseCrashlytics.instance;
//   } catch (e) {
//     debugPrint("Firebase Couldn't be initialized:$e");
//   }
// }

// await guardWithCrashlytics(
//   guardedMain,
//   crashlytics: crashlytics,
// );
// }

// void guardedMain() {
//   if (kReleaseMode) {
//     Logger.root.level = Level.WARNING;
//   }
//   Logger.root.onRecord.listen((record) {
//     debugPrint('${record.level.name}:${record.time}:'
//         '${record.loggerName}'
//         '${record.message}');
//   });
//   WidgetsFlutterBinding.ensureInitialized();
//   _log.info('Going  full screen');
//   SystemChrome.setEnabledSystemUIMode(
//     SystemUiMode.edgeToEdge,
//   );
//   runApp(MyApp());
// }
void main() {
  runApp(MyApp());
}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SettingsPersistence settingsPersistence =
      LocalStorageSettingsPersistence();
  final playerProgressPersistence = LocalStoragePlayerProgressPersistence();
  // TODO: Can initalize it later
  final AdsController? adsController = null;
  final SharedPrefGamesServicesControllerImpl gamesServicesControllerImpl =
      SharedPrefGamesServicesControllerImpl();
  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<Questions>(
            create: (context) => Questions(),
          ),
          ChangeNotifierProvider<LevelBook>(
            create: (context) => LevelBook(),
          ),
          // check  buttom for differences btw ChangeNotifierProvider and Provider
          ChangeNotifierProvider(create: (context) {
            var progress = PlayerProgress(playerProgressPersistence);
            progress.getLatestFromStore();
            return progress;
          }),
          Provider<GameServicesController?>(
              create: (context) => GameServicesController(
                  gamesServiceController:
                      SharedPrefGamesServicesControllerImpl())),
          // Provider<GameServicesController?>.value(value: SharedPrefGamesServicesControllerImpl),
          // TODO ADSCONTROLLER
          Provider<AdsController?>.value(value: adsController),
          // TODO INAPPURCHASE
          Provider<SettingsController>(
            create: (context) =>
                SettingsController(persistence: settingsPersistence)
                  ..loadStateFromPersistence(),
          ),
          Provider<StoreProvider>(
            create: (context) => StoreProvider(),
          ),
          // ProxyProvider<StoreProvider, Questions>(
          //     lazy: false,
          //     create: (context) => Questions(),
          //     update: (context, storeprovider, questions) {
          //       questions!.attachStore(storeprovider);
          //       return questions;
          //     }),
          ProxyProvider2<SettingsController, ValueNotifier<AppLifecycleState>,
              AudioController>(
            lazy: false,
            create: (context) => AudioController()..initialize(),
            update: (context, settings, lifecycleNotifer, audio) {
              if (audio == null) throw ArgumentError.notNull();
              audio.attachSettings(settings);
              audio.attachLifecycleNotifier(lifecycleNotifer);
              return audio;
            },
            dispose: (context, audio) => audio.dispose(),
          ),
          Provider(
            create: (context) => Palette(),
          )
        ],
        child: Builder(builder: (context) {
          final palette = context.watch<Palette>();
          return MaterialApp.router(
            title: 'Rhema bible Game',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: palette.darkPen,
                background: palette.backgroundMain,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(color: palette.ink),
              ),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            // This fix the go router error i had
            routerConfig: AppRoutes.routes,
            scaffoldMessengerKey: scaffoldMessengerKey,
          );
        }),
      ),
    );
  }
}



// In the provided code snippet, the `Provider` and 
//`ChangeNotifierProvider` are used from the `provider` 
// package to manage the state of different parts of the application.

// ### Provider vs. ChangeNotifierProvider:


// 1. **Provider:**
//    - The generic `Provider` is a general-purpose provider that 
//      can be used to provide any type of object or value.
//    - It doesn't automatically notify its listeners when 
//      the provided value changes. If you're using it with a
//      mutable object and you want to rebuild widgets 
//      when that object changes, you need to manually call `Provider.of` 
//      or `context.watch` to trigger a rebuild.

// 2. **ChangeNotifierProvider:**
//    - `ChangeNotifierProvider` is a specialized provider 
//      that is designed to work with classes that extend 
//      `ChangeNotifier`.
//    - It automatically listens for changes in the provided 
//      `ChangeNotifier` and triggers a rebuild of the widgets that 
//       depend on it when the state changes.
//    - It is particularly useful when you have a class that 
//      represents a piece of mutable state and you want to rebuild 
//       widgets whenever that state changes.

// ### Usage in the Code:

// In the code snippet:

// - `ChangeNotifierProvider` is used for managing the state 
//    of a `PlayerProgress` object. The `PlayerProgress` class 
//    likely extends `ChangeNotifier` or has a `ChangeNotifier` mixin, 
//    indicating that it can notify its listeners when its state changes. 
//     The `ChangeNotifierProvider` is used to automatically handle the 
//     rebuilding of widgets when the `PlayerProgress` state changes.

// - `Provider` is used for providing instances of 
//    `SettingsController` and `Palette`. In this context, it seems 
//    that these classes may not have built-in state management like 
//    `ChangeNotifier`. The provided instances are used for configuration 
//     and managing non-changing aspects of the app, such as settings and 
//     color palettes.

// ### Returning `progress`:

// The `create` callback in `ChangeNotifierProvider` is a factory 
// method that returns an instance of the provided class. In this case:

// ```dart
// ChangeNotifierProvider(create: (context) {
//   var progress = PlayerProgress(playerProgressPersistence);
//   progress.getLatestFromStore();
//   return progress;
// }),
// ```

// The `PlayerProgress` instance is created and initialized with 
//  data loaded from the `playerProgressPersistence`. The 
//  `getLatestFromStore()` method is likely used to retrieve the latest 
//  state of the player's progress from some persistent storage. The 
//  reason for returning `progress` is so that it can be accessed by the 
//  widgets in the widget tree that depend on it. The widgets will 
//  automatically rebuild when the state of `progress` changes, thanks to 
//  the `ChangeNotifierProvider`.
