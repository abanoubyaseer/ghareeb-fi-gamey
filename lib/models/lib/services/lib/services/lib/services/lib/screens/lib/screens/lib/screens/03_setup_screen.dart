import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '04_write_words_screen.dart';

// شاشة الإعداد - من 3 لـ 40 لاعب، ومن 1 لـ 5 غرباء

class SetupScreen extends StatefulWidget {
  final GameSession session;
  const SetupScreen({super.key, required this.session});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  int playerCount = 5;
  int impostorCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(title: const Text('إعداد اللعبة'), backgroundColor: AppColors.purple, foregroundColor: AppColors.gold),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('عدد اللعيبة: $playerCount', style: const TextStyle(color: Colors.white, fontSize: 22)),
            Slider(min: 3, max: 40, value: playerCount.toDouble(), activeColor: AppColors.gold, onChanged: (v) => setState(() => playerCount = v.toInt())),
            const SizedBox(height: 20),
            Text('عدد الغرباء: $impostorCount', style: const TextStyle(color: Colors.white, fontSize: 22)),
            Slider(min: 1, max: 5, value: impostorCount.toDouble(), activeColor: AppColors.gold, onChanged: (v) => setState(() => impostorCount = v.toInt())),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14)),
              onPressed: () {
                widget.session.players = List.generate(playerCount, (i) => 'لاعب ${i + 1}');
                widget.session.impostorCount = impostorCount;
                Navigator.push(context, MaterialPageRoute(builder: (_) => WriteWordsScreen(session: widget.session)));
              },
              child: const Text('كمل', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
