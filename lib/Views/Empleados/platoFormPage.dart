import 'package:flutter/material.dart';
import 'package:proyecto/Models/plato.dart';
import 'package:proyecto/Services/plato_service.dart';

class PlatoFormPage extends StatefulWidget {
  final Plato? plato;

  PlatoFormPage({this.plato});

  @override
  _PlatoFormPageState createState() => _PlatoFormPageState();
}

class _PlatoFormPageState extends State<PlatoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final PlatoService _platoService = PlatoService();

  @override
  void initState() {
    super.initState();
    if (widget.plato != null) {
      _nameController.text = widget.plato!.name;
      _imageUrlController.text = widget.plato!.imageUrl;
      _priceController.text = widget.plato!.price.toString();
      _descriptionController.text = widget.plato!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plato == null ? 'Agregar Plato' : 'Editar Plato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre del Plato'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del plato';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'URL de la Imagen'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la URL de la imagen';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el precio del plato';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la descripción del plato';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _savePlato,
                child: Text(widget.plato == null ? 'Agregar' : 'Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _savePlato() {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String imageUrl = _imageUrlController.text;
      final double price = double.parse(_priceController.text);
      final String description = _descriptionController.text;

      if (widget.plato == null) {
        _platoService.addPlato(
          Plato(
              name: name,
              imageUrl: imageUrl,
              price: price,
              description: description),
        );
      } else {
        _platoService.updatePlato(
          widget.plato!,
          Plato(
              name: name,
              imageUrl: imageUrl,
              price: price,
              description: description),
        );
      }

      Navigator.pop(context);
    }
  }
}
