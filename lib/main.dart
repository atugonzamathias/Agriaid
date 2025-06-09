import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'config/firebase_options.dart';
import 'app.dart';

// ✅ Import your providers
import 'providers/user_provider.dart';
import 'features/disease_detection/providers/disease_detection_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DiseaseDetectionProvider()),
      ],
      child: const AgriAidApp(),
    ),
  );
}
