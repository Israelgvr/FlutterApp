class UserEntity {
  final String nombre;
  final String apellidoPa;
  final String apellidoMa;
  final String sexo;
  final String fechaNacimiento;
  final String direccion;
  final String telefono;
  final String email;
  final String password;

  UserEntity({
    required this.nombre,
    required this.apellidoPa,
    required this.apellidoMa,
    required this.sexo,
    required this.fechaNacimiento,
    required this.direccion,
    required this.telefono,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "nombre": nombre,
      "apellidoPa": apellidoPa,
      "apellidoMa": apellidoMa,
      "sexo": sexo,
      "fechaNacimiento": fechaNacimiento,
      "direccion": direccion,
      "telefono": telefono,
      "email": email,
      "password": password,
    };
  }
}
