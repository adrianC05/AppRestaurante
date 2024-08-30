import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/Services/carrito_service.dart';
import 'package:proyecto/Models/item_compra.dart';
import 'package:proyecto/Services/factura_service.dart';
import 'package:proyecto/Models/factura_model.dart';

class Factura extends StatelessWidget {
  final String tableNumber;

  Factura({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    final carritoService = Provider.of<CarritoService>(context);
    final List<ItemCompra> items = carritoService.items;
    final double total = carritoService.calcularTotal();
    final InvoiceService invoiceService = InvoiceService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Factura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.itemName, style: TextStyle(fontSize: 18)),
                        Text('\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Preparar los datos de la factura
                  FacturaModel factura = FacturaModel(
                    id: '', // El ID será asignado automáticamente por Firebase
                    tableNumber: tableNumber,
                    productos: items
                        .map((item) => {
                              'itemName': item.itemName,
                              'price': item.price,
                            })
                        .toList(),
                    total: total,
                  );

                  print(
                      'Factura a guardar: ${factura.toFirestore()}'); // Esto imprimirá los datos que estás enviando

// Guardar la factura en Firebase
                  await invoiceService.saveInvoice(factura);

                  // Vaciar el carrito después de guardar la factura
                  carritoService.vaciarCarrito();

                  // Mostrar un mensaje de confirmación
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Factura guardada exitosamente')),
                  );

                  // Volver a la pantalla anterior o hacer alguna otra acción
                  Navigator.pop(context);
                },
                child: Text('Pago', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
