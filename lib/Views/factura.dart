import 'package:flutter/material.dart';

class Factura extends StatelessWidget {
  final String tableNumber;

  Factura({
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
