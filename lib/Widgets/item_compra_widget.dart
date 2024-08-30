import 'package:flutter/material.dart';
import 'package:proyecto/Models/item_compra.dart';

class ItemCompraWidget extends StatelessWidget {
  final ItemCompra item;
  final VoidCallback onDelete;

  ItemCompraWidget({required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(Icons.shopping_cart, color: Colors.deepPurple),
        ),
        title: Text(
          'Producto: ${item.itemName}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Precio: \$${item.price.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        trailing: TextButton(
          child: Text('Eliminar', style: TextStyle(color: Colors.red)),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
