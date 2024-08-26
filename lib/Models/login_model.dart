class LoginModel {
  final String usuario;
  final String contrasena;
  
  LoginModel({
    required this.usuario,
    required this.contrasena,
  });

  factory LoginModel.fromFirestore(Map<String, dynamic> data) {
    return LoginModel(
      usuario: data['usuario'] ?? '',
      contrasena: data['contrasena'] ?? '',
    );
  }
}