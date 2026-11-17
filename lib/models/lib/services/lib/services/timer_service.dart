import 'dart:async';

// التايمر - فيه تحذير خفيف عند ثلثين الوقت
// وتحذير قبل 30 ثانية - وجرس قوي في الآخر
// ولو قفلت التطبيق، التايمر بيقف

class TimerService {
  Timer? _timer;
  int remaining = 0;
  Function(int)? onTick;
  Function()? onTwoThirds;
  Function()? onThirtySeconds;
  Function()? onFinish;

  void start(int seconds) {
    remaining = seconds;
    bool warnedTwoThirds = false;
    bool warnedThirty = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      remaining--;
      onTick?.call(remaining);
      if (!warnedTwoThirds && remaining <= (seconds * 2 ~/ 3)) {
        warnedTwoThirds = true;
        onTwoThirds?.call();
      }
      if (!warnedThirty && remaining == 30) {
        warnedThirty = true;
        onThirtySeconds?.call();
      }
      if (remaining <= 0) {
        t.cancel();
        onFinish?.call();
      }
    });
  }

  void pause() => _timer?.cancel();
  void resume() => start(remaining);
  void cancel() => _timer?.cancel();
}
