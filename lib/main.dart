import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/register_bloc.dart';
import 'data/services/api_service.dart';
import 'data/repository/user_repository.dart';
import 'domain/useCase/register_user_use_case.dart';
import 'presentation/pages/register_page.dart';
import 'presentation/login/inicio_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(

        scaffoldBackgroundColor: const Color(0xFF000C3B), // Fondo principal del scaffold
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000C3B), // Fondo del AppBar
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF000C3B), // Color principal
          secondary: const Color(0xFF0F1657), // Color secundario
          background: const Color(0xFF000000), // Fondo oscuro
        ),
        hintColor: Colors.orange, // Color para campos de entrada, etc.
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Color de texto
        ),
      ),
      home: const InicioScreen(),
    );
  }
}
