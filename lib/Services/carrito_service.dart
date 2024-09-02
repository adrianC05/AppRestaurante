import 'package:flutter/material.dart';
import 'package:proyecto/Models/item_compra.dart';

class CarritoService extends ChangeNotifier {
  static final CarritoService _instance = CarritoService._internal();
  factory CarritoService() => _instance;
  CarritoService._internal();

  final List<ItemCompra> _items = [];
  bool _mostrarFactura = false;

  List<ItemCompra> get items => List.unmodifiable(_items);

  bool get mostrarFactura => _mostrarFactura;

  void agregarItem(ItemCompra item) {
    _items.add(item);
    notifyListeners(); // Notifica a los listeners cuando cambia el carrito
  }

  void eliminarItem(ItemCompra item) {
    _items.remove(item);
    notifyListeners(); // Notifica a los listeners cuando cambia el carrito
  }

  double calcularTotal() {
    return _items.fold(0.0, (total, item) => total + item.price);
  }

  void vaciarCarrito() {
    _items.clear();
    _mostrarFactura = false;
    notifyListeners(); // Notifica a los listeners cuando cambia el carrito
  }

  void mostrarFacturaItems() {
    _mostrarFactura = true;
    notifyListeners(); // Notifica a los listeners cuando cambia el carrito
  }
}
