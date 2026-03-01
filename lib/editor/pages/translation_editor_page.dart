import 'dart:ui';

import 'package:darq/darq.dart' show InsertEveryExtension, OrderByExtension;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/choice_voting_block.dart';
import 'package:odusg/helpers/iterable_extensions.dart';
import 'package:odusg/i18n/strings.g.dart';
import 'package:odusg/models/scenario.dart';

class TranslationEditorPage extends HookWidget {
  const TranslationEditorPage({super.key, required this.scenario});

  final ValueNotifier<Scenario> scenario;

  @override
  Widget build(BuildContext context) {
    final s = scenario.value;
    final translations = useState(s.translations);
    final selectedLocale = useState(
      AppLocaleUtils.findDeviceLocale().languageCode,
    );
    useMemoized(() {
      if (translations.value.isEmpty) {
        final ttlKeys = _ttlKeys();
        final copy = translations.value.entries.toMap(
          (x) => x.key,
          (x) => x.value,
        );
        copy[selectedLocale.value] = ttlKeys;
        copy["en"] = ttlKeys.entries.toMap((x) => x.key, (x) => x.value);
        translations.value = copy;
      }
      return;
    }, [scenario.value.uid]);
    final isSearching = useState(false);
    final searchText = useState("");
    //DONE
    //Maybe when no translations yet, then init with current locale
    //Collect all Translation Keys from scenario to fill empty map
    //Add search function
    //Add swiping function for delete and edit
    //Save changes
    //Maybe multi languale Translation edit dialog

    //TODO Implement Body
    return DefaultTabController(
      length: translations.value.length,
      child: Scaffold(
        appBar: AppBar(
          title:
              isSearching.value
                  ? TextField(
                    autofocus: true,
                    onChanged: (value) => searchText.value = value,
                    decoration: InputDecoration(hintText: t.$wip('Search')),
                  )
                  : Text(t.$wip("Translations")),
          actions: [
            isSearching.value
                ? IconButton(
                  onPressed: () {
                    isSearching.value = false;
                    searchText.value = "";
                  },
                  icon: Icon(Icons.cancel_outlined),
                )
                : IconButton(
                  onPressed: () => isSearching.value = true,
                  icon: Icon(Icons.search),
                ),
            IconButton(
              onPressed: () async {
                final res = await _editDialog(
                  context,
                  translations.value.keys.toMap((x) => x, (_) => null),
                );
                if (res == null) return;
                final newMap = <String, Map<String, String>>{};
                newMap.addAll(translations.value);
                for (final element in res.$1.entries) {
                  var map = newMap[element.key];
                  map ??= newMap[element.key] = {};

                  if (res.$2 != res.$3) map.remove(res.$2);
                  map[res.$3] = element.value ?? "";
                }
                translations.value = newMap;
              },
              icon: Icon(Icons.add),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: translations.value.select((x, y) => Tab(text: x)),
          ),
        ),
        body: TabBarView(
          children:
              translations.value.entries
                  .map(
                    (tab) => ListView(
                      children:
                          tab.value.entries
                              .orderBy((x) => x.key.toLowerCase())
                              .where(
                                (translation) =>
                                    searchText.value.isEmpty ||
                                    "${translation.key}${translation.value}"
                                        .toLowerCase()
                                        .contains(
                                          searchText.value.toLowerCase(),
                                        ),
                              )
                              .map(
                                (translation) => _translationTile(
                                  context,
                                  translation,
                                  tab,
                                  translations,
                                ),
                              )
                              .insertEvery(
                                Divider(height: 8, thickness: 2),
                                step: 1,
                              )
                              .toList(),
                    ),
                  )
                  .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            scenario.value = scenario.value.copyWith(
              translations: translations.value,
            );
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget _translationTile(
    BuildContext context,
    MapEntry<String, String> translation,
    MapEntry<String, Map<String, String>> tab,
    ValueNotifier<Map<String, Map<String, String>>> translations,
  ) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.startToEnd:
            final newMap = <String, Map<String, String>>{};
            newMap.addAll(translations.value);
            var map = newMap[tab.key];
            map!.remove(translation.key);
            translations.value = newMap;
          default:
            return;
        }
      },
      confirmDismiss: (direction) {
        final dismissed =
            direction == DismissDirection.endToStart ? false : true;

        if (!dismissed) {
          _editDialog(
            context,
            translations.value.keys.toMap(
              (x) => x,
              (x) => translations.value[x]![translation.key],
            ),
            tab.key,
            translation.key,
          ).then((x) async {
            final ret = x;
            if (ret != null) {
              valueEdited(translations, ret);
            }
          });
        }

        return Future.value(dismissed);
      },
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete),
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.edit),
          ),
        ),
      ),
      child: ListTile(
        title: Padding(
          padding: EdgeInsetsGeometry.only(bottom: 4),
          child: Text(translation.key),
        ),
        subtitle: Text(translation.value),
        onTap: () async {
          final res = await _editDialog(
            context,
            translations.value.keys.toMap(
              (x) => x,
              (x) => translations.value[x]![translation.key],
            ),
            tab.key,
            translation.key,
          );
          if (res == null) return;
          valueEdited(translations, res);
        },
      ),
    );
  }

  void valueEdited(
    ValueNotifier<Map<String, Map<String, String>>> translations,
    (Map<String, String?> localeTranslations, String? odlkey, String newKey)
    res,
  ) {
    final newMap = <String, Map<String, String>>{};
    newMap.addAll(translations.value);
    for (var element in res.$1.entries) {
      var map = newMap[element.key];
      map ??= newMap[element.key] = {};
      if (res.$2 != res.$3) map.remove(res.$2);
      map[res.$3] = element.value ?? "";
    }
    translations.value = newMap;
  }

  Map<String, String> _ttlKeys() {
    void extractFromBlock(Map<String, String> keys, Iterable<Block> blocks) {
      for (var block in blocks) {
        keys[block.text] = block.text;
        if (block.ttsMessage != null) {
          keys[block.ttsMessage!] = block.ttsMessage!;
        }
        if (block.image != null) keys[block.image!] = block.image!;
        keys.addAll(block.perTagText);

        switch (block) {
          case ChoiceVotingBlock cvb:
            keys.addAll(cvb.choices.toMap((x) => x.text, (x) => x.text));
            break;
          case NextButtonBlock nbb:
            keys[nbb.buttonText] = nbb.buttonText;
            break;
          case GroupBlock gb:
            extractFromBlock(keys, gb.steps.map((x) => x.block));
            break;
          case SingleChildExecutorBlock sceb:
            extractFromBlock(keys, sceb.steps.map((x) => x.block));
            break;
          default:
            break;
        }
      }
    }

    final s = scenario.value;

    final keys = <String, String>{};
    keys[s.title] = s.title;
    keys[s.description] = s.description;

    keys.addAll(scenario.value.roles.toMap((x) => x.intlKey, (x) => x.intlKey));
    // keys.addAll(scenario.value.steps.mapMany((x) => {},
    // ));
    extractFromBlock(keys, scenario.value.steps.map((x) => x.block));
    keys.remove(null);
    keys.remove("");

    return keys;
  }

  Future<(Map<String, String?> localeTranslations, String? odlkey, String key)?>
  _editDialog(
    BuildContext context,
    Map<String, String?> localeTranslations, [
    String? currentTab,
    String? key,
  ]) async {
    final copyMap = <String, String?>{};
    copyMap.addAll(localeTranslations);
    final builder = AlertDialog(
      title: HookBuilder(
        builder: (context) {
          final keyController = useTextEditingController(text: key);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: keyController,
                decoration: InputDecoration(labelText: t.$wip('Key')),
                readOnly:
                    key != null && !localeTranslations.values.contains(key),
              ),
              for (final locTra in localeTranslations.entries)
                HookBuilder(
                  builder: (c) {
                    final translationController = useTextEditingController(
                      text: locTra.value,
                    );
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ExpansionTile(
                          title: Text(locTra.key),
                          initiallyExpanded: locTra.key == currentTab,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                onChanged: (value) => copyMap[locTra.key] = value,
                                controller: translationController,
                                decoration: InputDecoration(
                                  labelText: t.$wip('Translation'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(t.$wip('DISCARD')),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pop((copyMap, key, keyController.value.text));
                    },
                    child: Text(t.$wip('SAVE')),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final res = await showDialog(
      context: context,
      builder: (context) => builder,
    );
    return res;
  }
}
