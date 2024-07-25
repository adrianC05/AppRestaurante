import 'package:flutter/material.dart';
import 'package:proyecto/Services/plato_service.dart';
import 'package:proyecto/Views/carrito.dart';
import 'package:proyecto/Views/factura.dart';
import 'package:proyecto/Views/Componentes/appBarComun.dart';

class Menu extends StatelessWidget {
  final String tableNumber;

  Menu({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    final dishes = PlatoService().getPlatos();

    return Scaffold(
      appBar: AppBarComun(title: 'Restaurante', tableNumber: tableNumber),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restaurant_menu, size: 30),
                SizedBox(width: 8),
                Text('Menu', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(dishes.length, (index) {
                final dish = dishes[index];
                return Card(
                  margin: EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        dish.imageUrl,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dish.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '\$${dish.price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // Navegar a la página del carrito
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Carrito(tableNumber: tableNumber),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Factura(tableNumber: tableNumber),
              ),
            );
          } else {
            // Permanece en la página actual (menú)
          }
        },
      ),
    );
  }
}
