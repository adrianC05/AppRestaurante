// services/auth_service.dart
import 'package:proyecto/Models/login_model.dart';

class AuthService {
  final User _staticUser = User(username: "usuario", password: "contraseña");

  bool login(String username, String password) {
    return username == _staticUser.username && password == _staticUser.password;
  }
}
