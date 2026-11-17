import 'dart:math';
import '../models/game_session.dart';

// ده العقل بتاع اللعبة - بيختار الكلمة والغرباء

class GameLogic {
  static void startGame(GameSession s) {
    // اختار كلمة عشوائية من اللي اللعيبة كتبوها - التكرار مسموح
    final rand = Random();
    s.secretWord = s.words[rand.nextInt(s.words.length)];

    // اختار الغرباء عشوائي تماما - مفيش نمط ثابت
    List<int> all = List.generate(s.players.length, (i) => i);
    all.shuffle(rand);
    s.impostorIndexes = all.take(s.impostorCount).toList();
  }

  static bool isImpostor(GameSession s, int playerIndex) {
    return s.impostorIndexes.contains(playerIndex);
  }
}
