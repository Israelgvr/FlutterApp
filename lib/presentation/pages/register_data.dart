import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

//import '../login/dashboard_screen.dart';
import '../sidebar/sidebar_layout.dart';


class RegisterDatosScreen extends StatefulWidget {
  const RegisterDatosScreen({super.key});

  @override
  _RegisterDatosScreenState createState() => _RegisterDatosScreenState();
}

class _RegisterDatosScreenState extends State<RegisterDatosScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaController = TextEditingController();
  final TextEditingController _apellidoMaController = TextEditingController();
  String? _sexo;
  final TextEditingController _fechaNacimientoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _passwordsMatch = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SideBarLayout()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Llenado de Formulario",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView( //para manejar scroll 
            child: Column(
              children: [
                _buildTextField(_nombreController, "Nombre", validator: (value) {
                  if (value == null || value.isEmpty) return "Ingrese su Nombre";
                  return null;
                }),
                _buildTextField(_apellidoPaController, "Apellido Paterno"),
                _buildTextField(_apellidoMaController, "Apellido Materno"),
                SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: _sexo,
                  decoration: _inputDecoration("Genero"),
                  dropdownColor: Colors.blue.shade900, // Fondo del menú desplegable
                  style: const TextStyle(color: Colors.white),
                  iconSize: 30,
                  items: ["Masculino", "Femenino"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(color: Colors.white70)), // Texto blanco en el menú
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _sexo = newValue;
                    });
                  },
                  validator: (value) => value == null ? "Seleccione un genero" : null,
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: _fechaNacimientoController,
                  decoration: _inputDecoration("Fecha de Nacimiento").copyWith(
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.white70),
                  ),
                  style: const TextStyle(color: Colors.white),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _fechaNacimientoController.text = "${pickedDate.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                  validator: (value) => value!.isEmpty ? "Seleccione una fecha" : null,
                ),
                SizedBox(height: 20),

                _buildTextField(_direccionController, "Dirección"),

                _buildTextField(_telefonoController, "Teléfono", 
                keyboardType: TextInputType.phone, 
                validator: (value) {
                  if (value == null || value.isEmpty) return "Ingrese su Teléfono";
                  if (!RegExp(r'^[0-9]{7,15}$').hasMatch(value)) return "Ingrese un teléfono válido (7-15 dígitos)";
                  return null;
                }),
            
                _buildTextField(_emailController, "Correo", keyboardType: TextInputType.emailAddress, validator: (value) {
                  if (!EmailValidator.validate(value!) || !value.endsWith("@gmail.com")) {
                    return "Ingrese un correo Gmail válido";
                  }
                  return null;
                }),
                _buildTextField(_passwordController, "Contraseña", obscureText: true, validator: (value) {
                  if (value!.length < 4) return "Mínimo 4 caracteres";
                  return null;
                }),

                _buildTextField(_confirmPasswordController, "Confirmar Contraseña", obscureText: true, validator: (value) {
                  setState(() => _passwordsMatch = _passwordController.text == value);
                  return _passwordsMatch ? null : "Las contraseñas no coinciden";
                }, borderColor: _passwordsMatch ? Colors.green : Colors.red),
            
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(245, 241, 17, 17),
                  ),
                  child: Ink(

                    decoration: BoxDecoration(
                      gradient:const LinearGradient(
                        colors: [Color(0xBA10E3FF),Color(0xFF0CF1F1),],
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 200,
                        minHeight: 40,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Enviar", 
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {
    TextInputType keyboardType = TextInputType.text, 
    bool obscureText = false, 
    String? Function(String?)? validator, 
    Color borderColor = Colors.white
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: _inputDecoration(label).copyWith(),
        style: TextStyle(color: Colors.white),
        validator: validator, // Usamos la validación que pasemos como parámetro
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.transparent,// color de fondo de los input
      
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white60,
          width: 2,
        )
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white, width: 1), // Borde blanco sólido
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white, width: 2), // Borde blanco al enfocar
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2), // Borde rojo en error
      ),
    );
  }
}
