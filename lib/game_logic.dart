import 'dart:math';

import 'package:odusg/extensions.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/widgets/player_name_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_logic.g.dart';

@riverpod
class EventManager extends _$EventManager {
  @override
  int build() {
    return 0;
  }
}

@Riverpod(keepAlive: true)
Random random(RandomRef ref) {
  return Random();
}

@riverpod
class PlayerManager extends _$PlayerManager {
  @override
  List<Player> build() {
    final names = ref.read(playerNamesProvider);
    names.shuffle();
    var bads = (names.length / 2 - 1);
    final random = ref.read(randomProvider);

    List<int> badsIndx = [];
    for (var i = 0; i < bads; i++) {
      final newBadI = random.nextInt(names.length);
      if (badsIndx.contains(newBadI)) {
        i--;
      } else {
        badsIndx.add(newBadI);
      }
    }

    return names.mapIndexed((x, i) {
      final keyWords = [x, "$x 1", "$x 2", "$x 3", "$x 4"];
      keyWords.shuffle();
      return Player(
          name: x, bad: badsIndx.contains(i), keyWord: x, keyWordSet: keyWords);
    }).toList();
  }
}
