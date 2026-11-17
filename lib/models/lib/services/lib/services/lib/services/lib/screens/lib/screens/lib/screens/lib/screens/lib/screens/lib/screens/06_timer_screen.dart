import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '../services/timer_service.dart';
import '07_vote_screen.dart';

// شاشة التايمر - تحذير خفيف عند ثلثين الوقت
// تحذير قبل 30 ثانية - جرس قوي في الآخر
// لو قفلت التطبيق، التايمر بيقف ويسألك تكمل ولا تلغي

class TimerScreen extends StatefulWidget {
  final GameSession session;
  const TimerScreen({super.key, required this.session});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with WidgetsBindingObserver {
  final timer = TimerService();
  String message = 'اتناقشوا واعرفوا مين الغريب';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timer.onTick = (r) => setState(() {});
    timer.onTwoThirds = () => setState(() => message = '⚠️ قرب الوقت يخلص - ركزوا');
    timer.onThirtySeconds = () => setState(() => message = '⏰ فاضل 30 ثانية بس!');
    timer.onFinish = () => setState(() => message = '🔔🔔🔔 الوقت خلص!');
    timer.start(widget.session.timerSeconds);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) timer.pause();
    if (state == AppLifecycleState.resumed) {
      showDialog(context: context, builder: (_) => AlertDialog(
        title: const Text('رجعت تاني؟'),
        content: const Text('التايمر وقف لما خرجت. تكمل ولا تلغي؟'),
        actions: [
          TextButton(onPressed: () { Navigator.pop(context); timer.cancel(); Navigator.pop(context); }, child: const Text('إلغاء')),
          ElevatedButton(onPressed: () { Navigator.pop(context); timer.resume(); }, child: const Text('كمل')),
        ],
      ));
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final min = timer.remaining ~/ 60;
    final sec = timer.remaining % 60;
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${min}:${sec.toString().padLeft(2, '0')}', style: const TextStyle(color: AppColors.gold, fontSize: 70, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(message, style: const TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14)),
              onPressed: () {
                timer.cancel();
                Navigator.push(context, MaterialPageRoute(builder: (_) => VoteScreen(session: widget.session)));
              },
              child: const Text('خلصنا - صوتوا', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
