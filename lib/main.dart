import 'package:flutter/material.dart';
import 'package:gymstats/pages/login.dart';
import 'package:gymstats/widget/bottomNavigationBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymStats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrangeAccent,
        ),
        scaffoldBackgroundColor: Colors.black,
        // Imposta il colore di testo per un tema scuro
        textTheme: ThemeData.dark().textTheme.apply(
              bodyColor: Colors.white, // Colore di testo principale
              displayColor: Colors.white, // Colore di testo per titoli
            ),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}
