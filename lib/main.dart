import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/onboarding_screen.dart';
import 'package:islami_app/sura_details/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute:"/" ,
      routes: {
          OnboardingScreen.routeName:(context)=>const OnboardingScreen(),
          SuraDetailsScreen.routeName:(context)=> SuraDetailsScreen(),
          HomeScreen.routeName:(context)=> HomeScreen(),


      },
    );
  }
}