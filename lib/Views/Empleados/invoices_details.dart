import 'package:flutter/material.dart';
import 'package:proyecto/Models/factura_model.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final FacturaModel factura;

  InvoiceDetailsPage({required this.factura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Factura'),
        backgroundColor: Colors.deepPurple, // Mantén el color de fondo morado
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Número de Factura: ${factura.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Mesa: ${factura.tableNumber}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Productos:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: factura.productos.length,
                itemBuilder: (context, index) {
                  final producto = factura.productos[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '${producto['itemName']}: \$${producto['price']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Total: \$${factura.total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
