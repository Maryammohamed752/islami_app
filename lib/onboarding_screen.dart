
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName="/";
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("assets/images/onboarding.png"),
    );
  }
}
