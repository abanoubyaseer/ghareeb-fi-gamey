import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '../services/game_logic.dart';
import '06_timer_screen.dart';

// شاشة تمرير الموبايل - مفيش عد تنازلي هنا
// اللاعب يدوس لما يخلص قراية

class PassDeviceScreen extends StatelessWidget {
  final GameSession session;
  final int playerIndex;
  const PassDeviceScreen({super.key, required this.session, required this.playerIndex});

  @override
  Widget build(BuildContext context) {
    final isImpostor = GameLogic.isImpostor(session, playerIndex);
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('لاعب ${playerIndex + 1}', style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(isImpostor ? 'انت الغريب! 🤫' : 'الكلمة هي: ${session.secretWord}', style: const TextStyle(color: AppColors.gold, fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text(isImpostor ? 'انت عارف انك غريب، بس مش عارف الكلمة' : 'احفظ الكلمة ومتقولهاش', style: const TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14)),
              onPressed: () {
                if (playerIndex + 1 >= session.players.length) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => TimerScreen(session: session)));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PassDeviceScreen(session: session, playerIndex: playerIndex + 1)));
                }
              },
              child: Text(playerIndex + 1 >= session.players.length ? 'ابدأ النقاش' : 'أنا خلصت - اللي بعده', style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
