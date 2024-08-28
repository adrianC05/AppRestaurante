import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/Models/menu_model.dart';

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MenuModel?> menu(BuildContext context, String nombre,
      String descripcion, double precio) async {
    try {
      // Buscar usuario en Firestore
      QuerySnapshot querySnapshot = await _firestore
          .collection('menu') // Nombre de la colección en Firestore
          .where('nombre', isEqualTo: nombre)
          .where('descripcion', isEqualTo: descripcion)
          .where('precio', isEqualTo: precio)
          .get();
    } catch (e) {
      print('Error al registrar producto: $e');
      return null; // Error durante el login
    }
  }
}
