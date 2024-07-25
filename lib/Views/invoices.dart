import 'package:flutter/material.dart';
import 'package:proyecto/Views/invoices_details.dart';
import 'package:proyecto/Views/login.dart';

class InvoicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre del Restaurante', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.deepPurple,
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
              'assets/images/restaurant_bg.jpg', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenido de la vista
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                InvoiceCard(invoiceNumber: '01', amount: '9.99'),
                InvoiceCard(invoiceNumber: '02', amount: '19.99'),
                InvoiceCard(invoiceNumber: '03', amount: '29.99'),
                InvoiceCard(invoiceNumber: '04', amount: '39.99'),
                InvoiceCard(invoiceNumber: '05', amount: '49.99'),
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pago',
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
    );
  }
}

class InvoiceCard extends StatelessWidget {
  final String invoiceNumber;
  final String amount;

  InvoiceCard({required this.invoiceNumber, required this.amount});

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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
