import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '02_category_screen.dart';

// الشاشة الرئيسية - أول شاشة بتظهر
// مفيش عداد جولات هنا

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('غريب في gameي', style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: AppColors.gold)),
            const SizedBox(height: 12),
            const Text('مين الغريب فينا؟', style: TextStyle(fontSize: 20, color: AppColors.white)),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(session: GameSession())));
              },
              child: const Text('ابدأ اللعب', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
