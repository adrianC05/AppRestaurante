// views/invoices_page.dart
import 'package:flutter/material.dart';
import 'package:proyecto/services/factura_service.dart';
import 'package:proyecto/models/factura_model.dart';
import 'package:proyecto/views/invoices_details.dart'; // Asegúrate de tener la importación correcta
import 'package:proyecto/views/login_view.dart';

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
