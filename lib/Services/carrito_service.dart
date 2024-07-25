import 'package:proyecto/Models/item_compra.dart';

class CarritoService {
  final List<ItemCompra> items = [
    ItemCompra(itemName: 'Platillo 1', price: '5.99'),
    ItemCompra(itemName: 'Platillo 2', price: '15.99'),
    ItemCompra(itemName: 'Platillo 3', price: '25.99'),
    ItemCompra(itemName: 'Platillo 4', price: '35.99'),
    ItemCompra(itemName: 'Platillo 6', price: '5.99'),
    ItemCompra(itemName: 'Platillo 7', price: '9.99'),
    ItemCompra(itemName: 'Platillo 8', price: '8.99'),
  ];

  double calcularTotal() {
    double total = 0;
    for (var item in items) {
      total += double.parse(item.price);
    }
    return total;
  }
}
