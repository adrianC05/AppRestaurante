import 'package:flutter/material.dart';
import 'package:proyecto/Models/plato.dart';
import 'package:proyecto/Services/plato_service.dart';
import 'package:proyecto/Views/Empleados/platoFormPage.dart';

class ManagePlatosPage extends StatefulWidget {
  @override
  _ManagePlatosPageState createState() => _ManagePlatosPageState();
}

class _ManagePlatosPageState extends State<ManagePlatosPage> {
  final PlatoService _platoService = PlatoService();

  @override
  Widget build(BuildContext context) {
    final platos = _platoService.getPlatos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar Platos'),
      ),
      body: ListView.builder(
        itemCount: platos.length,
        itemBuilder: (context, index) {
          final plato = platos[index];
          return ListTile(
            leading: Image.network(plato.imageUrl,
                width: 50, height: 50, fit: BoxFit.cover),
            title: Text(plato.name),
            subtitle: Text('\$${plato.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showPlatoForm(context, plato: plato);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deletePlato(plato);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPlatoForm(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  void _showPlatoForm(BuildContext context, {Plato? plato}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlatoFormPage(plato: plato),
      ),
    ).then((_) {
      setState(() {}); // Refrescar la lista después de agregar o editar
    });
  }

  void _deletePlato(Plato plato) {
    setState(() {
      _platoService.deletePlato(plato);
    });
  }
}
