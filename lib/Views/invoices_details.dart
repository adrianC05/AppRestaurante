import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final String invoiceNumber;
  final String amount;

  InvoiceDetailsPage({required this.invoiceNumber, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Factura'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple.shade100,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/invoices.png', // Asegúrate de que esta ruta es correcta
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Número de Factura:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      invoiceNumber,
                      style: TextStyle(fontSize: 22, color: Colors.deepPurple),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Monto:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${amount}',
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Fecha:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '01/01/2024', // Datos estáticos de ejemplo
                      style: TextStyle(fontSize: 22, color: Colors.grey.shade700),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Descripción:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Factura de ejemplo para la demostración de la aplicación.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
