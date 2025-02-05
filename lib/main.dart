import 'package:flutter/material.dart';
import 'presentation/login/inicio_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pal-GYM',
      theme: ThemeData(

        scaffoldBackgroundColor: const Color(0xFF000C3B), // Fondo principal del scaffold
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000C3B), // Fondo del AppBar
          ///
          titleTextStyle: TextStyle(color: Colors.white), // Color del título del AppBar
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF000C3B), // Color principal
          secondary: const Color(0xFF0F1657), // Color secundario
          surface: const Color(0xFF000000), // Fondo oscuro
        ),
        hintColor: Colors.orange, // Color para campos de entrada, etc.
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Color de texto
        ),
      ),
      home: const InicioScreen(),
      //home: RegisterPage(),
    );
  }
}
