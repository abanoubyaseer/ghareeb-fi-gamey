import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '08_result_screen.dart';

// شاشة التصويت - صوتوا على مين الغريب

class VoteScreen extends StatefulWidget {
  final GameSession session;
  const VoteScreen({super.key, required this.session});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(title: const Text('صوتوا - مين الغريب؟'), backgroundColor: AppColors.purple, foregroundColor: AppColors.gold),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.session.players.length,
                itemBuilder: (_, i) => Card(
                  color: selected == i ? AppColors.gold : AppColors.purpleLight,
                  child: ListTile(
                    title: Text('لاعب ${i + 1}', style: TextStyle(color: selected == i ? Colors.black : Colors.white, fontSize: 20), textAlign: TextAlign.center),
                    onTap: () => setState(() => selected = i),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14)),
              onPressed: selected == null ? null : () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen(session: widget.session, votedIndex: selected!)));
              },
              child: const Text('اعرض النتيجة', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
