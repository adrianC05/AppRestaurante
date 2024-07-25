import 'package:flutter/material.dart';
import 'package:proyecto/Views/Componentes/appBarComun.dart';
import 'package:proyecto/Views/carrito.dart';
import 'package:proyecto/Views/menu.dart';

class Factura extends StatelessWidget {
  final String tableNumber;

  Factura({
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComun(title: 'Factura', tableNumber: tableNumber),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  Icons.attach_money_rounded,
                  size: 100,
                  color: Color.fromARGB(255, 49, 133, 182),
                ),
                SizedBox(height: 20),
                Text(
                  'Detalles de la Factura',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Producto', style: TextStyle(fontSize: 18)),
                    Text('Precio', style: TextStyle(fontSize: 18)),
                  ],
                ),
                Divider(),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Acción para el botón de pago
              },
              child: Text('Pago', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Carrito(tableNumber: tableNumber,),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Factura',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pedido',
          ),
        ],
      ),
    );
  }
}
