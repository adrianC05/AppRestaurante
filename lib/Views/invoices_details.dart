import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final String invoiceNumber;
  final String amount;
  final List<Map<String, String>> products; // Lista de productos con nombre y ruta de imagen

  InvoiceDetailsPage({
    required this.invoiceNumber,
    required this.amount,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre del Restaurante', style: TextStyle(fontSize: 20)),
        backgroundColor: Color.fromARGB(148, 0, 54, 90),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  Icons.attach_money_rounded, // Puedes cambiar esto por cualquier ícono que prefieras
                  size: 100,
                  color: Color.fromARGB(255, 49, 133, 182), // Ajusta el color del ícono si es necesario
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
          Expanded(
            child: ListView(
              children: <Widget>[
                // Lista de productos
                ...products.map((product) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Image.asset(product['imagePath']!, height: 50), // Imagen del producto
                            SizedBox(width: 10),
                            Text(product['name']!, style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Text('\$${product['price']}', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  );
                }).toList(),
                SizedBox(height: 20),
                // Total
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('\$${amount}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 40), // Espacio antes del botón de pago
              ],
            ),
          ),
          // Botón de Pago
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Acción para el botón de pago
              },
              child: Text('Pago', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Color de fondo del botón
                foregroundColor: Colors.black, // Color del texto del botón
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacio adicional después del botón
        ],
      ),
    );
  }
}
