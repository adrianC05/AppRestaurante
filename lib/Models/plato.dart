import 'package:cloud_firestore/cloud_firestore.dart';

class Plato {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  Plato({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  factory Plato.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Plato(
      id: doc.id,
      name: data['nombre'],
      imageUrl: data['imagen'],
      price: data['precio'],
      description: data['descripcion'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nombre': name,
      'imagen': imageUrl,
      'precio': price,
      'descripcion': description,
    };
  }
}
