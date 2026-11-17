import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/game_session.dart';
import '03_setup_screen.dart';

// شاشة اختيار التصنيف

class CategoryScreen extends StatelessWidget {
  final GameSession session;
  const CategoryScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final categories = ['عام', 'أكل', 'أماكن', 'مشاهير', 'رياضة', 'أفلام'];
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(title: const Text('اختار التصنيف'), backgroundColor: AppColors.purple, foregroundColor: AppColors.gold),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: categories.length,
        itemBuilder: (_, i) => Card(
          color: AppColors.purpleLight,
          child: ListTile(
            title: Text(categories[i], style: const TextStyle(color: Colors.white, fontSize: 22), textAlign: TextAlign.center),
            onTap: () {
              session.category = categories[i];
              Navigator.push(context, MaterialPageRoute(builder: (_) => SetupScreen(session: session)));
            },
          ),
        ),
      ),
    );
  }
}
