import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urban_eats/pages/homepage.dart';
import 'package:urban_eats/pages/main_page.dart';
import 'package:urban_eats/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness:
          Brightness
              .dark, // Use dark icons (or Brightness.light for white icons)
      systemNavigationBarColor:
          Colors.black, // Set the navigation bar color if needed
    ),
  );

  runApp(UberEats(hasSeenOnboarding: hasSeenOnboarding));
}

class UberEats extends StatelessWidget {
  final bool hasSeenOnboarding;
  const UberEats({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasSeenOnboarding ? MainPage() : OnboardingScreen(),
    );
  }
}
