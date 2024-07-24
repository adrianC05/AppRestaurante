import 'package:flutter/material.dart';
import 'package:proyecto/Services/plato_service.dart';

class Menu extends StatelessWidget {
  final String tableNumber;

  Menu({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    final dishes = PlatoService().getPlatos();

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
              children: List.generate(dishes.length, (index) {
                final dish = dishes[index];
                return Card(
                  margin: EdgeInsets.all(16.0),
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
                      /* Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dish.description,
                          style: TextStyle(fontSize: 14),
                        ),
                      ), */
                    ],
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
