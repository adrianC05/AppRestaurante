import 'package:flutter/material.dart';
import 'package:proyecto/Services/carrito_service.dart';
import 'package:proyecto/Models/item_compra.dart';
import 'package:proyecto/widgets/item_compra_widget.dart';
import 'package:provider/provider.dart';

class Carrito extends StatelessWidget {
  final String tableNumber;

  Carrito({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: Consumer<CarritoService>(
        builder: (context, carritoService, child) {
          double total = carritoService.calcularTotal();

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: carritoService.items.length,
                    itemBuilder: (context, index) {
                      final item = carritoService.items[index];
                      return ItemCompraWidget(
                        item: item,
                        onDelete: () {
                          carritoService.eliminarItem(item);
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, -1),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total: \$${total.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón PEDIR
                        },
                        child: Text('Pedir',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
