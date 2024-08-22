import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_app/firebase_options.dart';
import 'package:pizza_app/pages/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/models/restaurant.dart';
import 'package:pizza_app/themes/theme_provider.dart';
import 'components/my_favourite_provider.dart'; // Import your provider
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        // Theme provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        // Restaurant provider
        ChangeNotifierProvider(
          create: (context) => Restaurant(),
        ),
        // FavouriteSaved provider
        ChangeNotifierProvider(
          create: (context) => FavouriteSaved(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      // home: LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
