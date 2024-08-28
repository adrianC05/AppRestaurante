// lib/Views/Empleados/invoice_details_page.dart
import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final String invoiceNumber;
  final String amount;
  final List<Map<String, String>> products;

  InvoiceDetailsPage({
    required this.invoiceNumber,
    required this.amount,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Factura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Factura: $invoiceNumber',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Total: \$$amount',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Productos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...products.map((product) {
              return ListTile(
                leading: Image.asset(product['imagePath']!),
                title: Text(product['name']!),
                subtitle: Text('Precio: \$${product['price']}'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
