import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '../services/game_logic.dart';
import '05_pass_device_screen.dart';

// شاشة كتابة الكلمات - الكلمة ظاهرة مش نجوم

class WriteWordsScreen extends StatefulWidget {
  final GameSession session;
  const WriteWordsScreen({super.key, required this.session});

  @override
  State<WriteWordsScreen> createState() => _WriteWordsScreenState();
}

class _WriteWordsScreenState extends State<WriteWordsScreen> {
  final controller = TextEditingController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(title: Text('لاعب ${current + 1} اكتب كلمة'), backgroundColor: AppColors.purple, foregroundColor: AppColors.gold),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('اكتب كلمة من التصنيف - الكلمة ظاهرة مش نجوم', style: TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              obscureText: false,
              style: const TextStyle(color: Colors.black, fontSize: 22),
              decoration: const InputDecoration(filled: true, fillColor: Colors.white, hintText: 'اكتب الكلمة هنا', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold),
              onPressed: () {
                if (controller.text.trim().isEmpty) return;
                widget.session.words.add(controller.text.trim());
                controller.clear();
                if (current + 1 >= widget.session.players.length) {
                  GameLogic.startGame(widget.session);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PassDeviceScreen(session: widget.session, playerIndex: 0)));
                } else {
                  setState(() => current++);
                }
              },
              child: Text(current + 1 >= widget.session.players.length ? 'ابدأ توزيع الأدوار' : 'اللي بعده', style: const TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
