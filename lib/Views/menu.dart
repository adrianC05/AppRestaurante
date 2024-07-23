// lib/Views/menu_screen.dart
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String tableNumber;

  Menu({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurante'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text('Nro. Mesa $tableNumber',
                  style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
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
              children: List.generate(6, (index) {
                return Card(
                  margin: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Platillo ${index + 1}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedido',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Factura',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.green,
        onTap: (index) {
          // Aquí puedes manejar la navegación entre las diferentes secciones
        },
      ),
    );
  }
}
