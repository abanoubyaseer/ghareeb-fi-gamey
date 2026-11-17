import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'services/id_service.dart';
import 'screens/01_home_screen.dart';

// نقطة بداية التطبيق

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IdService.getPlayerId();
  runApp(const GhareebApp());
}

class GhareebApp extends StatelessWidget {
  const GhareebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'غريب في gameي',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.purple),
      home: const HomeScreen(),
    );
  }
}
