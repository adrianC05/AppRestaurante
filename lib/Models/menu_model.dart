class MenuModel {
  final String nombre;
  final String descripcion;
  final double precio;
  
  MenuModel({
    required this.nombre,
    required this.descripcion,
    required this.precio,
  });

  factory MenuModel.fromFirestore(Map<String, dynamic> data) {
    return MenuModel(
      nombre: data['nombre'] ?? '',
      descripcion: data['descripcion'] ?? '',
      precio: data['precio'] ?? '',
    );
  }
}