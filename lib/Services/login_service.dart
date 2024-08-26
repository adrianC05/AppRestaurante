import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> login(String usuario, String contrasena) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: usuario,
        password: contrasena,
      );
      return userCredential.user;
    } catch (e) {
      print("Error en el inicio de sesión: $e");
      return null;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
