import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/alerts/alerts_screen.dart';
import 'features/disease_detection/screens/disease_screen.dart'; // ✅ Import

class AgriAidApp extends StatelessWidget {
  const AgriAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriAid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/chat': (context) => const ChatScreen(),
        '/alerts': (context) => const AlertsScreen(),
        '/detect-disease': (context) => const DetectDiseaseScreen(), // ✅ Added
      },
    );
  }
}
