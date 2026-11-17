// إعلانات AdMob - مش هتزعج اللعيبة في الأول
// إعلان واحد بس بعد النتيجة، مش في نص اللعب

class AdsService {
  static bool adsEnabled = true;

  static void showInterstitialAfterResult() {
    if (!adsEnabled) return;
    // هنا بنحط كود AdMob بعد ما تاخد الـ Ad Unit ID
    // دلوقتي سايبينها فاضية عشان متزعجش حد
  }
}
