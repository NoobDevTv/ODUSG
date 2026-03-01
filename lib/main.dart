@MappableLib(discriminatorKey: "type") // will be applied to all classes
library;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/i18n/strings.g.dart';
import 'package:odusg/mappers/duration_mapper.dart';
import 'package:odusg/pages/export.dart';
import 'package:odusg/pages/manage_scenario_page.dart';
import 'package:odusg/pages/scenario_selector_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:slang/overrides.dart';

part 'main.g.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final ttsProvider = Provider<FlutterTts>((ref) => FlutterTts());

@Riverpod(keepAlive: true)
class GlobalRef extends _$GlobalRef {
  static late Ref globalRef;
  @override
  void build() {
    globalRef = ref;
  }
}

Future main() async {
  MapperContainer.globals.use(const DurationMapper());
  final prefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: const _EarlyInitializer(child: MyApp()),
      ),
    ),
  );
}

class _EarlyInitializer extends ConsumerWidget {
  final Widget child;

  const _EarlyInitializer({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(globalRefProvider);
    ref.watch(advancingProvider);

    return child;
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      title: 'ODUSG',
      routes: {
        "/main_menu": (_) => const MainMenuPage(),
        "/setup_game": (_) => const SetupGamePage(),
        "/scenario_selector": (_) => const ScenarioSelectorPage(),
        "/game": (_) => const GamePage(),
        "/manage_scenarios": (_) => const ManageScenarioPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      builder: (ctx, child) {
        final data = MediaQuery.of(ctx);
        return MediaQuery(
          data: data.copyWith(textScaler: const TextScaler.linear(1.3)),
          child: child ?? const SizedBox(),
        );
      },
      home: const MainMenuPage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ODUSG"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text("Main Menu"),
              onTap:
                  () => Navigator.pushReplacementNamed(context, "/main_menu"),
            ),
          ],
        ),
      ),
    );
  }
}
