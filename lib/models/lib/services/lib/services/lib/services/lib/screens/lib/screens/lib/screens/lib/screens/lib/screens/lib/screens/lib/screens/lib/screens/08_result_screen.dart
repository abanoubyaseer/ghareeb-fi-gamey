import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '../services/ads_service.dart';
import '01_home_screen.dart';
import '04_write_words_screen.dart';

// شاشة النتيجة - العب تاني بنفس الناس ومسح الكلمات القديمة

class ResultScreen extends StatelessWidget {
  final GameSession session;
  final int votedIndex;
  const ResultScreen({super.key, required this.session, required this.votedIndex});

  @override
  Widget build(BuildContext context) {
    final correct = session.impostorIndexes.contains(votedIndex);
    final impostorsText = session.impostorIndexes.map((i) => 'لاعب ${i + 1}').join(' و ');
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(correct ? 'صح! 🎉' : 'غلط! 😅', style: const TextStyle(color: AppColors.gold, fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('الغريب كان: $impostorsText', style: const TextStyle(color: Colors.white, fontSize: 22), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text('الكلمة كانت: ${session.secretWord}', style: const TextStyle(color: Colors.white, fontSize: 22), textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14)),
              onPressed: () {
                AdsService.showInterstitialAfterResult();
                // العب تاني بنفس الناس - امسح الكلمات القديمة
                session.resetWords();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => WriteWordsScreen(session: session)), (r) => false);
              },
              child: const Text('العب تاني بنفس الناس', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeScreen()), (r) => false);
              },
              child: const Text('لعبة جديدة من الأول', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
