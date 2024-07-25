import 'package:flutter/material.dart';
import 'package:proyecto/Views/invoices_details.dart'; // Asegúrate de tener la importación correcta
import 'package:proyecto/Views/login.dart';

class InvoicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre del Restaurante', style: TextStyle(fontSize: 20)),
        backgroundColor: Color.fromARGB(148, 0, 54, 90),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, size: 30),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/images/restaurant.jpg', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenido de la vista
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                InvoiceCard(invoiceNumber: '01', amount: '9.99', products: [
                  //{'name': 'Producto 1', 'imagePath': 'assets/images/item1.jpg', 'price': '9.99'},
                  {'name': 'Producto 2', 'imagePath': 'assets/images/item2.jpg', 'price': '19.99'},
                  {'name': 'Producto 3', 'imagePath': 'assets/images/item3.jpg', 'price': '29.99'},
                ]),
                InvoiceCard(invoiceNumber: '02', amount: '19.99', products: [
                  {'name': 'Producto 3', 'imagePath': 'assets/images/item3.jpg', 'price': '29.99'},
                  {'name': 'Producto 2', 'imagePath': 'assets/images/item2.jpg', 'price': '19.99'},
                  {'name': 'Producto 1', 'imagePath': 'assets/images/item1.jpg', 'price': '9.99'},
                ]),
                // Añade más InvoiceCard según sea necesario
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Facturas',
          )
        ],
        backgroundColor: Color.fromARGB(148, 0, 54, 90),
        selectedItemColor: Color.fromARGB(255, 7, 221, 43),
        unselectedItemColor: const Color.fromARGB(179, 255, 255, 255),
      ),
    );
  }
}

class InvoiceCard extends StatelessWidget {
  final String invoiceNumber;
  final String amount;
  final List<Map<String, String>> products;

  InvoiceCard({required this.invoiceNumber, required this.amount, required this.products});

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
          child: Icon(Icons.receipt_long, color: Colors.deepPurple),
        ),
        title: Text(
          'Número de Factura: $invoiceNumber',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Detalles: \$${amount}',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        trailing: TextButton(
          child: Text('Detalles', style: TextStyle(color: Colors.deepPurple)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InvoiceDetailsPage(
                  invoiceNumber: invoiceNumber,
                  amount: amount,
                  products: products,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
