// كل بيانات الجولة دي في الذاكرة بس - بتتمسح بعد اللعبة
// مفيش حفظ جولات ولا كلمات ولا نتايج

class GameSession {
  List<String> players = [];
  int impostorCount = 1;
  List<String> words = [];
  String secretWord = '';
  List<int> impostorIndexes = [];
  String category = '';
  int timerSeconds = 180;

  void resetWords() {
    words = [];
    secretWord = '';
    impostorIndexes = [];
  }
}
