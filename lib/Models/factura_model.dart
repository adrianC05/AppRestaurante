import 'package:cloud_firestore/cloud_firestore.dart';

class FacturaModel {
  final String id;
  final String tableNumber;
  final List<Map<String, dynamic>> productos;
  final double total;

  FacturaModel({
    required this.id,
    required this.tableNumber,
    required this.productos,
    required this.total,
  });

  factory FacturaModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return FacturaModel(
      id: doc.id,
      tableNumber: data['tableNumber'] ?? '',
      productos: List<Map<String, dynamic>>.from(data['productos'] ?? []),
      total: data['total'] ?? 0.0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'tableNumber': tableNumber,
      'productos': productos,
      'total': total,
    };
  }
}
