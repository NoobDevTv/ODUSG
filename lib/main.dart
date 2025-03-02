import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/pages/export.dart';
import 'package:odusg/pages/scenario_selector_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main.g.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

@Riverpod(keepAlive: true)
class GlobalRef extends _$GlobalRef {
  static late Ref globalRef;
  @override
  void build() {
    globalRef = ref;
  }
}

Future main() async {
  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const _EarlyInitializer(child: MyApp()),
  ));
}

class _EarlyInitializer extends ConsumerWidget {
  final Widget child;

  const _EarlyInitializer({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(globalRefProvider);

    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ODUSG',
      routes: {
        "/main_menu": (_) => const MainMenuPage(),
        "/setup_game": (_) => const SetupGamePage(),
        "/scenario_selector": (_) => const ScenarioSelectorPage(),
        "/game": (_) => const GamePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text("Main Menu"),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, "/main_menu"),
            )
          ],
        ),
      ),
    );
  }
}
