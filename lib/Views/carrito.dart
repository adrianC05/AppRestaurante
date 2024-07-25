import 'package:flutter/material.dart';
import 'package:proyecto/Views/Componentes/appBarComun.dart';
import 'package:proyecto/Views/menu.dart';
import 'package:proyecto/Views/factura.dart';

class Carrito extends StatelessWidget {
  final String tableNumber;

  Carrito({required this.tableNumber});

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

  @override
  Widget build(BuildContext context) {
    double total = calcularTotal();

    return Scaffold(
      appBar: AppBarComun(title: 'Carrito', tableNumber: tableNumber),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: items,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0), // Agrega padding aquí
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -1),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Total: \$${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón PEDIR
                    },
                    child: Text('Pedir', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.deepPurple, // Color de fondo del botón
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            // Navegar a la página del menú
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(tableNumber: tableNumber),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Factura(tableNumber: tableNumber),
              ),
            );// Navegar a la página de facturas (aquí debes implementar la lógica correspondiente)
          }
        },
      ),
    );
  }
}

class ItemCompra extends StatelessWidget {
  final String itemName;
  final String price;

  ItemCompra({required this.itemName, required this.price});

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
          'Producto: $itemName',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Precio: \$${price}',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        trailing: TextButton(
          child: Text('Eliminar', style: TextStyle(color: Colors.red)),
          onPressed: () {
            // Acción para eliminar el item del carrito
          },
        ),
      ),
    );
  }
}
