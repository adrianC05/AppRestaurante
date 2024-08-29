import 'package:flutter/material.dart';
import 'package:proyecto/Models/plato.dart';
import 'package:proyecto/Services/plato_service.dart';

class Menu extends StatelessWidget {
  final String tableNumber;

  Menu({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    final PlatoService _platoService = PlatoService();

    return StreamBuilder<List<Plato>>(
      stream: _platoService.getPlatos(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Ocurrió un error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final platos = snapshot.data!;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_menu, size: 30),
                  SizedBox(width: 8),
                  Text('Menu', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(platos.length, (index) {
                  final plato = platos[index];
                  return Card(
                    margin: EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          plato.imageUrl,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            plato.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$${plato.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
