// screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (data.name != 'usuario@gmail.com' || data.password != '12345') {
        return 'Usuario o contraseña incorrectos';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return 'No se encontró un usuario con ese correo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Bienvenido',
      logo: const AssetImage('assets/logo.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        userHint: 'Correo electrónico',
        passwordHint: 'Contraseña',
        confirmPasswordHint: 'Confirmar contraseña',
        forgotPasswordButton: '¿Olvidaste tu contraseña?',
        loginButton: 'Iniciar sesión',
        signupButton: 'Registrarse',
        recoverPasswordButton: 'Recuperar contraseña',
        recoverPasswordIntro: 'Recupera tu contraseña aquí',
        recoverPasswordDescription: 'Te enviaremos un correo para restaurar tu contraseña.',
        goBackButton: 'Volver',
        confirmPasswordError: 'Las contraseñas no coinciden',
        recoverPasswordSuccess: 'Correo enviado con éxito',
      ),
      theme: LoginTheme(
        primaryColor: const Color(0xFF000C3B),
        accentColor: const Color(0xFFF5A623),
        errorColor: Colors.redAccent,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyStyle: const TextStyle(
          color: Colors.white,
        ),
        textFieldStyle: const TextStyle(
          color: Colors.black,
        ),
        buttonStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          backgroundColor: const Color(0xFF000C3B),
          splashColor: const Color(0xFFF5A623),
          highlightColor: const Color(0xFF0F1657),
          elevation: 4.0,
          highlightElevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

        ),
      ),
    );
  }
}

