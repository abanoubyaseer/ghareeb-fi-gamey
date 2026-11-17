import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

// ده الملف الوحيد اللي بيخزن حاجة
// بيخزن الـ ID بس - مش بيخزن جولات ولا كلمات ولا نتايج

class IdService {
  static const String _key = 'player_id';
  static String? _cachedId;

  static Future<String> getPlayerId() async {
    if (_cachedId != null) return _cachedId!;
    final prefs = await SharedPreferences.getInstance();
    String? savedId = prefs.getString(_key);
    if (savedId == null) {
      savedId = 'GHRB-${_generateRandom()}';
      await prefs.setString(_key, savedId);
    }
    _cachedId = savedId;
    return savedId;
  }

  static String _generateRandom() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(6, (_) => chars[rand.nextInt(chars.length)]).join();
  }
}
