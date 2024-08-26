import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/Models/login_model.dart';

class LoginService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LoginModel?> login(BuildContext context, String usuario, String contrasena) async {
    try {
      // Buscar usuario en Firestore
      QuerySnapshot querySnapshot = await _firestore
          .collection('users') // Nombre de la colección en Firestore
          .where('usuario', isEqualTo: usuario)
          .where('contrasena', isEqualTo: contrasena)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Hay al menos un documento con el usuario proporcionado
        DocumentSnapshot doc = querySnapshot.docs.first;
        LoginModel user = LoginModel.fromFirestore(doc.data() as Map<String, dynamic>);

        // Validar contraseña (en un caso real, deberías usar hashing de contraseñas)
        if (_verifyPassword(contrasena, user.contrasena)) {
          return user; // Credenciales correctas
        } else {
          return null; // Contraseña incorrecta
        }
      } else {
        return null; // Usuario no encontrado
      }
    } catch (e) {
      print('Error al iniciar sesión: $e');
      return null; // Error durante el login
    }
  }

  bool _verifyPassword(String inputPassword, String storedPassword) {
    // Implementar la verificación segura de contraseñas
    return inputPassword == storedPassword; // Esto debe ser reemplazado por comparación de hash
  }
}
