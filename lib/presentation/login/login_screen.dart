import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:dio/dio.dart';
import 'package:prueba3/data/api/api_service.dart';
import 'package:prueba3/data/models/login_request.dart';
import 'package:prueba3/presentation/pages/personalized_plan.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../sidebar/sidebar.dart';
import '../sidebar/sidebar_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final Duration loginTime = const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    try {
      final dio = Dio();
      final apiService = ApiService(dio);

      final loginRequest = LoginRequest(
        correo: data.name,
        password: data.password,
      );

      final response = await apiService.login(loginRequest);

      if (response.token.isNotEmpty) {
        // Aquí puedes guardar el token si es necesario.
        // Guardar el token usando SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response.token);

        // También puedes guardar información del usuario si es necesario
        await prefs.setString('user_name', response.user.nombres);
        await prefs.setString('user_email', response.user.correo);



        return null;  // Login exitoso, no se devuelve error.
      } else {
        return 'Credenciales incorrectas';
      }
    } on DioError catch (e) {
      // Verificamos si el error tiene una respuesta de la API
      if (e.response != null && e.response?.data != null) {
        final errorMessage = e.response?.data['message'];

        // Retornamos el mensaje de error que la API proporciona
        return errorMessage ?? 'Error desconocido al iniciar sesión';
      } else {
        // Error de conexión o inesperado
        return 'No se pudo conectar al servidor. Intenta de nuevo.';
      }
    } catch (e) {
      // Cualquier otro error inesperado
      return 'Error inesperado: ${e.toString()}';
    }
  }


  Future<String?> _signupUser(SignupData data) async {
    // Lógica para registro de usuario si la necesitas
    return null;
  }

  Future<String?> _recoverPassword(String name) async {
    return 'No se encontró un usuario con ese correo';
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
          builder: (context) => SideBarLayout(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        userHint: 'Correo electrónico',
        passwordHint: 'Contraseña',
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
      ),
    );
  }
}
