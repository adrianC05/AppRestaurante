import 'package:flutter/material.dart';
import 'package:proyecto/Services/factura_service.dart';
import 'package:proyecto/Models/factura_model.dart';

class InvoicesPage extends StatefulWidget {
  @override
  _InvoicesPageState createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  late Future<List<FacturaModel>> futureInvoices;
  final InvoiceService invoiceService = InvoiceService();

  @override
  void initState() {
    super.initState();
    futureInvoices = invoiceService.fetchInvoices();
  }

  List<Map<String, String>> convertirProductos(
      List<Map<String, dynamic>> productos) {
    return productos.map((producto) {
      return producto.map((key, value) => MapEntry(key, value.toString()));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<FacturaModel>>(
          future: futureInvoices,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error al cargar las facturas.'));
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.map((factura) {
                  return InvoiceCard(
                    invoiceNumber: factura.id,
                    amount: factura.total.toStringAsFixed(2),
                    products: convertirProductos(factura.productos),
                  );
                }).toList(),
              );
            } else {
              return Center(child: Text('No se encontraron facturas.'));
            }
          },
        ),
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
          'Detalles: \$$amount',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        trailing: TextButton(
          child: Text('Detalles', style: TextStyle(color: Colors.deepPurple)),
          onPressed: () {
            // Implementa la navegación a los detalles de la factura
          },
        ),
      ),
    );
  }
}
