import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

class AgriAidApp extends StatelessWidget {
  const AgriAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriAid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LoginScreen(),
    );
  }
}
