import 'package:flutter/material.dart';
import 'package:urban_eats/pages/onboarding.dart';

void main() {
  runApp(const UberEats());
}

class UberEats extends StatelessWidget {
  const UberEats({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
