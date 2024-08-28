// lib/Views/Empleados/invoices_page.dart
import 'package:flutter/material.dart';
import 'package:proyecto/Views/Empleados/AppBarEmpleados.dart';
import 'package:proyecto/Views/Empleados/commonBottomNavigationBarEmpleados.dart';
import 'package:proyecto/Views/Empleados/invoices_details.dart';
import 'package:proyecto/services/factura_service.dart';
import 'package:proyecto/models/factura_model.dart';

class InvoicesPage extends StatefulWidget {
  @override
  _InvoicesPageState createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  late Future<List<Invoice>> futureInvoices;
  final InvoiceService invoiceService = InvoiceService();

  @override
  void initState() {
    super.initState();
    futureInvoices = invoiceService.fetchInvoices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/restaurant.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<List<Invoice>>(
              future: futureInvoices,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error al cargar las facturas.'));
                } else if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data!.map((invoice) {
                      return InvoiceCard(
                        invoiceNumber: invoice.invoiceNumber,
                        amount: invoice.amount,
                        products: invoice.products.map((product) {
                          return {
                            'name': product.name,
                            'imagePath': product.imagePath,
                            'price': product.price
                          };
                        }).toList(),
                      );
                    }).toList(),
                  );
                } else {
                  return Center(child: Text('No se encontraron facturas.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Definición de InvoiceCard directamente en invoices_page.dart
class InvoiceCard extends StatelessWidget {
  final String invoiceNumber;
  final String amount;
  final List<Map<String, String>> products;

  InvoiceCard({
    required this.invoiceNumber,
    required this.amount,
    required this.products,
  });

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
          'Detalles: \$$amount',
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
