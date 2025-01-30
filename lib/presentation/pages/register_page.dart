import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/register_bloc.dart';
import '../../domain/entities/user_entity.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Usuario registrado con éxito")),
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nombreController,
                    decoration: InputDecoration(labelText: "Nombre"),
                  ),
                  TextFormField(
                    controller: _apellidoPaController,
                    decoration: InputDecoration(labelText: "Apellido Paterno"),
                  ),
                  TextFormField(
                    controller: _apellidoMaController,
                    decoration: InputDecoration(labelText: "Apellido Materno"),
                  ),
                  TextFormField(
                    controller: _sexoController,
                    decoration: InputDecoration(labelText: "Sexo"),
                  ),
                  TextFormField(
                    controller: _fechaNacimientoController,
                    decoration: InputDecoration(labelText: "Fecha de Nacimiento"),
                  ),
                  TextFormField(
                    controller: _direccionController,
                    decoration: InputDecoration(labelText: "Dirección"),
                  ),
                  TextFormField(
                    controller: _telefonoController,
                    decoration: InputDecoration(labelText: "Teléfono"),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Contraseña"),
                  ),
                  SizedBox(height: 20),
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
                    child: Text("Registrar"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
