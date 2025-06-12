import 'package:flutter/material.dart';
import 'package:learnhero/widgets/bottom_nav_bar.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/missions_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const LearnHeroApp());
}

class LearnHeroApp extends StatelessWidget {
  const LearnHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnHero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3738BC),
          primary: const Color(0xFF3738BC),
          secondary: const Color(0xFF6C63FF),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3738BC),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const BottomNavigation(), // atualizado
        '/home': (context) => const HomeScreen(),
        '/missions': (context) => const MissionsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}
