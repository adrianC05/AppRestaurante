import 'package:flutter/material.dart';
import 'package:proyecto/Views/Componentes/appBarComun.dart';
import 'package:proyecto/Views/menu.dart';

class Carrito extends StatelessWidget {
  final String tableNumber;
  final CarritoService carritoService = CarritoService();

  Carrito({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    double total = carritoService.calcularTotal();

    return Scaffold(
      appBar: AppBarComun(title: 'Carrito', tableNumber: tableNumber),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: carritoService.items.length,
                itemBuilder: (context, index) {
                  final item = carritoService.items[index];
                  return ItemCompraWidget(item: item);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
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
                      backgroundColor: Colors.deepPurple,
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

class ItemCompraWidget extends StatelessWidget {
  final ItemCompra item;

  ItemCompraWidget({required this.item});

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
          'Precio: \$${item.price}',
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
