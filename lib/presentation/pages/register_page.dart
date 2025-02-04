import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/register_bloc.dart';
import '../../domain/entities/user_entity.dart';
import '../login/dashboard_screen.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoPaController = TextEditingController();
  final _apellidoMaController = TextEditingController();
  final _sexoController = TextEditingController();
  final _fechaNacimientoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Usuario registrado con éxito")),
            );
            // Redirigir al Dashboard después de registrar al usuario
            Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const DashboardScreen()),
              );
            });
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildTextField(_nombreController, "Nombre"),
                  _buildTextField(_apellidoPaController, "Apellido Paterno"),
                  _buildTextField(_apellidoMaController, "Apellido Materno"),
                  _buildTextField(_sexoController, "Sexo"),
                  _buildTextField(_fechaNacimientoController, "Fecha de Nacimiento"),
                  _buildTextField(_direccionController, "Dirección"),
                  _buildTextField(_telefonoController, "Teléfono"),
                  _buildTextField(_emailController, "Email", isEmail: true),
                  _buildTextField(_passwordController, "Contraseña", isPassword: true),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final user = UserEntity(
                          nombre: _nombreController.text,
                          apellidoPa: _apellidoPaController.text,
                          apellidoMa: _apellidoMaController.text,
                          sexo: _sexoController.text,
                          fechaNacimiento: _fechaNacimientoController.text,
                          direccion: _direccionController.text,
                          telefono: _telefonoController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        context.read<RegisterBloc>().register(user);
                      }
                    },
                    child: const Text("Registrar"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isEmail = false, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Este campo es obligatorio";
          }
          if (isEmail && !RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
            return "Ingrese un correo válido";
          }
          return null;
        },
      ),
    );
  }
}
